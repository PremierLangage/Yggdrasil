import operator
import sys
from copy import deepcopy
from io import StringIO
from typing import Callable, Dict, List, NoReturn, Optional, Union, Any, Tuple
from unittest import mock

import jinja2

from mockinput import mock_input

_default_template_dir = ''
#_default_template_dir = 'templates/generic/jinja/'
_default_test_template = _default_template_dir + 'testitem.html'
_default_group_template = _default_template_dir + 'testgroup.html'

_default_params = {
    "report_success": False,
    "fail_fast": True,
}


class GraderError(Exception):
    """Exception raised when an unforeseen error due to the exercise author
    occurs. """
    pass


class StopGrader(Exception):
    """Exception raised when the fail_fast parameter is set for some Test
    instance and an assertion fails."""
    pass


class Test:
    """
    Test runner. Manages code to be run, execution context, effects,
    assertions about the execution's outcome, and test decription.
    """
    _number: int = 0  # Test rank in session.

    def __init__(self, code: str, weight: int = 1, **params):
        """Test instance initializaton.

        :param code: Code to test.
        :param weight: Weight of the test on total grade.
        :param params: Additional test control parameters. Currently
            allowed keys are:
            - report_success (bool): whether or not to report passed assertions;
            - fail_fast (bool): whether or not to stop after the first error.
        """
        self.code: str = code
        self.weight = weight
        self.expression: Optional[str] = None
        self.params = _default_params.copy()
        self.params.update(params)
        self.number: int = Test._number
        Test._number += 1

        # execution context (backup)
        self.previous_state: Optional[Dict[str, Any]] = None
        self.previous_inputs: Optional[List[str]] = None

        # execution context (current)
        self.current_state: Dict[str, Any] = {}
        self.current_inputs: List[str] = []
        self.argv: List[str] = []

        # execution effects
        self.output: str = ""
        self.exception: Optional[Exception] = None
        self.result: Any = None

        # test description
        self.title: Optional[str] = None
        self.descr: Optional[str] = None
        self.hint: Optional[str] = None
        self.weight: Optional[int] = 1

        # assertions
        self.assertions: List[Assert] = []
        self.status: bool = True

    def copy(self):
        """
        Make a copy of `self`, including the current state and available
        inputs and command-line arguments.

        Does nos include previous state, results, assertions, etc.

        :return: historyless copy of the current test instance.
        """
        t = Test(self.code)
        t.current_state = deepcopy(self.current_state)
        t.current_inputs = self.current_inputs.copy()
        t.argv = self.argv.copy()
        return t

    """Code execution."""

    def summarize_changes(self) -> Tuple[
            Dict[str, any], List[str], Dict[str, Any], List[str]]:
        """
        Computes the effects of the last execution (as performed by a call to
        `run()`) on the global state and input buffer.

        :return: tuple `(added, deleted, modified, inputs)`, where:
            - `added` is a dictionary mapping new identifiers to their values;
            - `deleted` is a list of deleted identifiers;
            - `momdified` is a dictionary mapping existing identifiers to their
            (new) values;
            - `inputs` is a list of read input lines.
        """
        deleted = list(self.previous_state.keys() - self.current_state.keys())

        modified = {
            var1: self.current_state[var1]
            for var1 in self.previous_state.keys() & self.current_state.keys()
            if self.previous_state[var1] != self.current_state[var1]}

        added = {var: self.current_state[var] for var in
                 self.current_state.keys() - self.previous_state.keys()}

        n = len(self.previous_inputs) - len(self.current_inputs)
        inputs = self.previous_inputs[:n]

        return added, deleted, modified, inputs

    def run(self, expression: str = None, **kwargs) -> NoReturn:
        """
        Runs the test's code and/or an expression in the current context.

        This method manages multiple optional arguments allowing it to
        control many execution settings. Arguments are of three kinds:
        context arguments which modify the execution's context, description
        arguments, and assertion arguments which entail automatic assertions
        on the execution.

        For details on the allowed arguments, see `parse_description_args`,
        `parse_context_args` and `parse_assertion_args`.

        :param expression: Expression to be evaluated (optional).
        :param kwargs: Additional context, description or assertion parameters.
        """
        self.expression = expression

        # parse description-related keyword arguments
        self.parse_description_args(kwargs)
        if self.title is None:
            self.set_default_title()

        # parse context-related keyword arguments
        self.parse_context_args(kwargs)

        # backup starting state
        self.previous_state = deepcopy(self.current_state)
        self.previous_inputs = self.current_inputs.copy()

        # prepare StringIO for stdout simulation
        out_stream = StringIO()

        # run the code while mocking input, sys.argv and stdout printing
        with mock_input(self.current_inputs, self.current_state):
            with mock.patch.object(sys, 'argv', self.argv):
                with mock.patch.object(sys, 'stdout', out_stream):
                    try:
                        if expression is None:
                            exec(self.code, self.current_state)
                        else:
                            self.result = eval(expression, self.current_state)
                    except Exception as e:
                        self.exception = e

        # cleanup state
        del self.current_state['__builtins__']

        # store generated output
        self.output = out_stream.getvalue()

        # parse assertion-related keyword arguments
        self.parse_assertion_args(kwargs)

    def parse_assertion_args(self, kwargs) -> NoReturn:
        """
        Parse assertion arguments to the `run()` method.

        Currently allowed arguments are :
        - exception: if exception=SomeExceptionClass is passed, check it is
          indeed raised;
        - allow_exception: is exception is None or not passed,
          and 'allow_exception' is either absent or False, forbid exceptions;
        - values: a disctionary of values whose existence and value to check;
        - allow_global_change: if present and False, forbid changes to globals;
        - output: check output (for strict equality for now);
        - result: check evaluation result, fails if no expression is passed.
        :param kwargs: Argument dictionary.
        """

        # manage exceptions
        if 'exception' in kwargs and kwargs['exception'] is not None:
            # if parameter exception=SomeExceptionClass is passed, silently
            # check it is indeed raised
            self.assert_exception(kwargs['exception'])
        elif 'allow_exception' not in kwargs or not kwargs['allow_exception']:
            # unless exceptions are explicitly allowed by parameter
            # allow_exception=True, forbid them
            self.assert_no_exception(report_success=False)
        # check global values
        if 'values' in kwargs:
            # for now we have no facility to check that some variable was
            # deleted, we only check that some variables exist
            self.assert_variable_values(**kwargs['values'])
        if ('allow_global_change' in kwargs
                and not kwargs['allow_global_change']):
            # forbid changes to global variables
            self.assert_no_global_change()
        # check for standard output
        if 'output' in kwargs:
            self.assert_output(kwargs['output'])
        # check for evaluation result, only valid if an expression is provided
        if 'result' in kwargs:
            if 'expression' is None:
                raise GraderError("Vérification du résultat demandée, "
                                  "mais pas d'expression fournie")
            else:
                self.assert_result(kwargs['result'])

    def parse_context_args(self, kwargs):
        """
        Parse context arguments to the `run()` method.

        Currently allowed arguments are :
        - globals: set global variables (erasing all others);
        - inputs: set available input lines (erasing all others);
        - argv: set available command-line arguments (erasing all others).

        :param kwargs: Argument dictionary.
        """
        # set global variables (overwrites the whole global namespace)
        if 'globals' in kwargs:
            self.current_state = kwargs['globals']
        # set available inputs
        if 'inputs' in kwargs:
            self.current_inputs = kwargs['inputs']
        # set available program parameters (overrides sys.argv)
        if 'argv' in kwargs:
            self.argv = kwargs['argv']

    def parse_description_args(self, kwargs):
        """
        Parse description arguments to the `run()` method.

        Currently allowed arguments are :
        - title: set test title;
        - descr: set test description;
        - hint: set hint in case of failure;
        - weight: set test weight.

        :param kwargs: Argument dictionary.
        """
        # set title
        if 'title' in kwargs:
            self.title = kwargs['title']
        # set description
        if 'descr' in kwargs:
            self.descr = kwargs['descr']
        # set hint
        if 'hint' in kwargs:
            self.hint = kwargs['hint']
        # set weight
        if 'weight' in kwargs:
            self.weight = kwargs['weight']

    """Assertions."""

    def assert_output(self, expected: Any, cmp: Callable = operator.eq) -> bool:
        """
        Assert that the last run's output equals `expected` (using `cmp` as
        comparison operator).

        :param expected: Expected value of the output.
        :param cmp: Output comparison function.
        :return: Assertion status.
        """
        status = cmp(expected, self.output)
        self.record_assertion(OutputAssert(status, expected))
        return status

    def assert_result(self, expected: Any, cmp: Callable = operator.eq) -> bool:
        """
        Assert that the last run's result equals `expected` (using `cmp` as
        comparison operator).

        :param expected: Expected value of the result.
        :param cmp: Output comparison function.
        :return: Assertion status.
        """
        status = cmp(expected, self.result)
        self.record_assertion(ResultAssert(status, expected))
        return status

    def assert_variable_values(self, cmp=operator.eq, **expected) -> bool:
        """
        Assert that the values of some variables after the last run equal
        their values in the `expected` dictionary (using `cmp` as comparison
        operator).

        :param expected: Expected value of the variables.
        :param cmp: Value comparison function.
        :return: Assertion status.
        """
        if not expected:
            raise ValueError("No expected variable values provided.")
        state = self.current_state
        missing = list(expected.keys() - state.keys())
        incorrect = {var: state[var] for var in expected.keys() & state.keys()
                     if not cmp(expected[var], state[var])}

        status = not (missing or incorrect)
        self.record_assertion(
            VariableValuesAssert(status, expected, missing, incorrect))
        return status

    def assert_no_global_change(self) -> bool:
        """
        Assert that no global variables changed during the last run.

        :return: Assertion status.
        """
        added, deleted, modified, _ = self.summarize_changes()
        status = not (added or deleted or modified)
        self.record_assertion(NoGlobalChangeAssert(status))
        return status

    def assert_no_exception(self, **params) -> bool:
        """
        Assert that no exception was raised during the last run.

        :return: Assertion status.
        """
        status = self.exception is None
        self.record_assertion(NoExceptionAssert(status, **params))
        return status

    def assert_exception(self, exception_type: type(Exception)) -> bool:
        """
        Assert that an exception of type `exception_type` was raised during the
        last run.

        :return: Assertion status.
        """
        status = isinstance(self.exception, exception_type)
        self.record_assertion(
            ExceptionAssert(status, exception_type))
        return status

    def record_assertion(self, assertion: 'Assert') -> NoReturn:
        """
        Record an assertion (using an Assertion object) in the test's history.
        """
        self.assertions.append(assertion)
        self.status = self.status and assertion.status

    """Feedback"""

    def context(self) -> str:
        """
        Returns a HTML-formatted string describing a test's previous
        execution context.

        Includes existing global variables and their values, available input
        lines, and command-line arguments.

        :return: Full-text HTML formatted description of context.
        """
        res = []

        if self.previous_state:
            res.append("Variables globales : {}".format(
                self.previous_state))
        if self.previous_inputs:
            res.append("Entrées disponibles : {}".format(
                self.previous_inputs))
        if self.argv:
            res.append("Arguments du programme : {}".format(self.argv))

        return "<br/>".join(res)

    def results(self) -> str:
        """
        Returns a HTML-formatted string describing a test's effect.

        Includes results (if an expression was evaluated), created,
        modified and deleted global variables, read input lines, printed
        text, raised exceptions.

        :return: Full-text HTML formatted description of run effects.
        """
        res = []
        added, deleted, modified, inputs = self.summarize_changes()

        if self.expression is not None:
            res.append("Résultat obtenu : {}".format(self.result))
        if added:
            res.append("Variables créées : {}".format(added))
        if modified:
            res.append("Variables modifiées : {}".format(modified))
        if deleted:
            res.append("Variables supprimées : {}".format(deleted))
        if inputs:
            res.append("Lignes saisies : {}".format(inputs))
        if self.output:
            res.append("Texte affiché : {!r}".format(self.output))
        if self.exception:
            res.append("Exception levée : {} ({})".format(
                type(self.exception).__name__, self.exception))
        if not res:
            res.append("Aucun effet observable")

        return "<br/>".join(res)

    def set_default_title(self) -> NoReturn:
        """
        Sets default test title.
        """
        if self.expression is None:
            self.title = "Exécution du programme"
        else:
            self.title = "Évaluation de {!r}".format(self.expression)

    def get_grade(self):
        """
        Gets test grade. Currently only 0 or self.weight.
        """
        return (self.status * self.weight), self.weight

    def render(self) -> str:
        """
        Returns a Jinja2 HTML-formatted description of the test.

        :return: HTML-formatted report on the test.
        """
        with open(_default_test_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(test=self)

    def make_id(self) -> str:
        """
        Make a (session-)unique id for the test, using its number.

        :return: Unique id of the form test_<number>
        """
        return 'test_' + str(self.number)


class TestGroup:
    """
    Groups of Test instances sharing a title.

    Feedback for test groups are supposed to share a <div> and a common
    description. Groups are intended to clarify the relationships between
    certain tests.
    """
    _num = 0

    def __init__(self, title: str, weight: int = 1, **params):
        """
        Initialize a TestGroup.

        :param title: Title of the test group (required). Try to be as clear
        as possible.
        :param weight: Weight in final TestSession grade. The whole groups's
        grade is multiplied by this factor before being added to other Test
        and TestGroup grades.
        :param params: Additional execution parameters such as fail_fast (
        default: True) and report_success (default: False).
        """
        self.num: int = TestGroup._num
        TestGroup._num += 1
        self.title: str = title
        self.weight: int = weight
        self.status: bool = True
        self.tests: List[Test] = []
        self.params = _default_params.copy()
        self.params.update(params)

    def append(self, test: 'Test') -> NoReturn:
        """
        Append a Test to a TestGroup's history.

        The Test instance to be appended should contain all relevant
        information for feedback (execution results, assertions, grade, etc.).

        :param test: The Test instance to append.
        """
        self.tests.append(test)

    def make_id(self) -> str:
        """
        Returns a (TestSession-)unique identifier for the current group.

        :return: Identifier of the form "group_<number>".
        """
        return 'group_' + str(self.num)

    def get_grade(self) -> Tuple[float, int]:
        """
        Returns a grade for the current group, normalized to the current
        group's weight.

        :return: Tuple `(g, w)` where `g` is a grade between 0 and `w`.
        """
        total_grade = total_weight = 0
        for test in self.tests:
            total, weight = test.get_grade()
            total_grade += total
            total_weight += weight
        return total_grade / total_weight * self.weight, self.weight

    def render(self) -> str:
        """
        Returns a Jinja2 HTML-formatted description of the TestGroup.

        :return: HTML-formatted report on the test group.
        """
        with open(_default_group_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(testgroup=self)

    def update_status(self, status) -> NoReturn:
        """
        Incorporate new test result into test group status.

        :param status: A new test status.
        """
        self.status = self.status and status


class TestSession:
    """
    Gather Test or TestGroup instances inside a session.

    TestSession instances manage test succession, group creation and closure,
    global parameters, and global grading.
    """

    def __init__(self, code: str, **params):
        """
        Initialize TestSession instance.

        :param code: Main code to test.
        :param params: Global session parameters. Currently allowed keys are:
            - report_success (bool, defaults to False): whether or not to
              report passed assertions;
            - fail_fast (bool, defaults to True): whether or not to stop after
              the first error.
        """
        self.history: List[Union[Test, TestGroup]] = []
        self.last_test: Optional[Test] = None
        self.next_test: Test = Test(code)
        self.current_test_group: Optional[TestGroup] = None
        self.params = _default_params.copy()
        self.params.update(params)

    """Group management."""

    def begin_test_group(self, title: str) -> NoReturn:
        """
        Open new test group.

        :param title: New test group's title.
        """
        self.current_test_group = TestGroup(title)
        self.history.append(self.current_test_group)

    def end_test_group(self) -> NoReturn:
        """
        Close the current test group.
        """
        if self.current_test_group and self.last_test:
            self.current_test_group.update_status(self.last_test.status)
        self.current_test_group = None
        self.last_test = None

    """ Grading """

    def get_grade(self):
        total_grade = total_weight = 0
        for test in self.history:
            total, weight = test.get_grade()
            total_grade += total
            total_weight += weight
        return total_grade / total_weight * 100

    """Rendering"""

    def render(self):
        return "\n".join(test.render() for test in self.history)

    """Setters for the next test."""

    def set_title(self, title):
        self.next_test.title = title

    def set_weight(self, weight):
        self.next_test.weight = weight

    def set_descr(self, descr):
        self.next_test.descr = descr

    def set_hint(self, hint):
        self.next_test.hint = hint

    """Setters for execution context."""

    def exec_preamble(self, preamble: str, **kwargs) -> NoReturn:
        exec(preamble, self.next_test.current_state, ** kwargs)
        del self.next_test.current_state['__builtins__']

    def set_globals(self, **variables) -> NoReturn:
        self.next_test.current_state = variables

    def set_state(self, state: dict) -> NoReturn:
        self.next_test.current_state = state

    def set_argv(self, argv: List[str]) -> NoReturn:
        self.next_test.argv = argv.copy()

    def set_inputs(self, inputs: List[str]) -> NoReturn:
        self.next_test.current_inputs = inputs.copy()

    """Execution"""

    def run(self, expression: str = None, **kwargs) -> NoReturn:
        self.next_test.run(expression, **kwargs)
        self.last_test = self.next_test
        self.next_test = self.last_test.copy()

        # record last test
        if self.current_test_group:
            self.current_test_group.append(self.last_test)
            self.current_test_group.update_status(self.last_test.status)
        else:
            self.history.append(self.last_test)

        if self.params.get('fail_fast', False) and not self.last_test.status:
            raise StopGrader("Failed assert during fail-fast test.")

    """Assertions."""

    # TODO: unhappy about code duplication in assertion mechanism, fix this.

    def assert_output(self, expected,
                      cmp: Callable = operator.eq):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_output(expected, cmp)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_result(self, expected,
                      cmp: Callable = operator.eq):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_result(expected, cmp)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_variable_values(self, cmp=lambda x, y: x == y, **expected):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_variable_values(cmp, **expected)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_no_global_change(self):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_no_global_change()
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_no_exception(self, **params):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_no_exception(**params)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_exception(self, exception_type):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_exception(exception_type)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")


class TextLabel:

    def __init__(self, text):
        self.text = text

    def render(self):
        return self.text


class Verbatim:

    def __init__(self, code):
        self.code = code

    def render(self):
        return "<code>{}</code>".format(self.code)


class Assert:
    _num = 0

    def __init__(self, status, params):
        self.num = Assert._num
        Assert._num += 1
        self.status = status
        self.params = _default_params.copy()
        self.params.update(params)


class OutputAssert(Assert):

    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        if self.status:
            return "Affichage correct"
        else:
            return "Affichage attendu : \n<code>\n{}\n</code>".format(
                self.expected)


class NoExceptionAssert(Assert):

    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        if self.status:
            return "Aucune exception levée"
        else:
            return "Exception anormale"


class ExceptionAssert(Assert):

    def __init__(self, status, exception: type(Exception), **params):
        super().__init__(status, params)
        self.exception = exception

    def __str__(self):
        if self.status:
            return "L'exception attendue a été levée"
        else:
            return "Une exception de type {} était attendue".format(
                self.exception)


class ResultAssert(Assert):

    def __init__(self, status, expected, **params):
        super().__init__(status, params)
        self.expected = expected

    def __str__(self):
        if self.status:
            return "Résultat correct"
        else:
            return "Résultat attendu : {!r}".format(self.expected)


class VariableValuesAssert(Assert):

    def __init__(self, status, expected, missing, incorrect, **params):
        super().__init__(status, params)
        self.expected = expected
        self.missing = missing
        self.incorrect = incorrect

    def __str__(self):
        if self.status:
            res = "Variables globales correctes"
        else:
            res = "Variables globales incorrectes : "
            details = []
            for var in self.missing:
                details.append("{} manquante".format(var))
            for var in self.incorrect:
                details.append("{} devrait valoir {!r}".format(
                    var, self.expected[var]))
            res += "; ".join(details)
        return res


class NoGlobalChangeAssert(Assert):

    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        if self.status:
            return "Variables globales inchangées"
        else:
            return "Variables globales modifiées"


