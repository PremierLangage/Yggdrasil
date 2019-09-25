from copy import deepcopy
from io import StringIO
import jinja2
from mockinput import mock_input
import sys
from typing import NoReturn, List, Callable, Union, Optional, Dict, Any
from unittest import mock

_default_template_dir = ''
# _default_template_dir = 'templates/generic/jinja/'
_default_test_template = _default_template_dir + 'testitem.html'
_default_group_template = _default_template_dir + 'testgroup.html'

_default_params = {
    "report_success": False,
    "fail_fast": True
}


class GraderError(Exception):
    pass


class StopGrader(Exception):
    pass


class Test:
    _number = 0

    def __init__(self, code: str, **params):
        self.code: str = code
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

        # assertions
        self.assertions: List[Assert] = []
        self.status: bool = True

    def copy(self):
        t = Test(self.code)
        t.current_state = deepcopy(self.current_state)
        t.current_inputs = self.current_inputs.copy()
        t.argv = self.argv.copy()
        return t

    """Code execution."""

    def summarize_changes(self):
        # TODO: cache results if clean
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

    def parse_assertion_args(self, kwargs):
        # manage exceptions
        if 'exception' in kwargs:
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
        # set title
        if 'title' in kwargs:
            self.title = kwargs['title']
        # set description
        if 'descr' in kwargs:
            self.descr = kwargs['descr']
        # set hint
        if 'hint' in kwargs:
            self.hint = kwargs['hint']

    """Assertions."""

    def assert_output(self, expected,
                      cmp: Callable = lambda x, y: x == y):
        status = cmp(expected, self.output)
        self.record_assertion(OutputAssert(status, expected))
        return status

    def assert_result(self, expected,
                      cmp: Callable = lambda x, y: x == y):
        status = cmp(expected, self.result)
        self.record_assertion(ResultAssert(status, expected))
        return status

    def assert_variable_values(self, cmp=lambda x, y: x == y, **expected):
        if not expected:
            return
        state = self.current_state
        missing = list(expected.keys() - state.keys())
        incorrect = {var: state[var] for var in expected.keys() & state.keys()
                     if not cmp(expected[var], state[var])}

        status = not (missing or incorrect)
        self.record_assertion(
            VariableValuesAssert(status, expected, missing, incorrect))
        return status

    def assert_no_global_change(self):
        added, deleted, modified, _ = self.summarize_changes()
        status = not (added or deleted or modified)
        self.record_assertion(NoGlobalChangeAssert(status))
        return status

    def assert_no_exception(self, **params):
        status = self.exception is None
        self.record_assertion(NoExceptionAssert(status, **params))
        return status

    def assert_exception(self, exception_type):
        status = isinstance(self.exception, exception_type)
        self.record_assertion(
            ExceptionAssert(status, exception_type))
        return status

    def record_assertion(self, assertion: 'Assert') -> NoReturn:
        self.assertions.append(assertion)
        self.status = self.status and assertion.status

    """Feedback"""

    def context(self):
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

    def results(self):
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

    def set_default_title(self):
        if self.expression is None:
            self.title = "Exécution du programme"
        else:
            self.title = "Évaluation de {!r}".format(self.expression)

    def render(self):
        with open(_default_test_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(test=self)

    def make_id(self):
        return 'test_' + str(self.number)


class TestGroup:
    _num = 0

    def __init__(self, title: str, **params):
        self.num: int = TestGroup._num
        TestGroup._num += 1
        self.title: str = title
        self.status: bool = True
        self.tests: List[Test] = []
        self.params = _default_params.copy()
        self.params.update(params)

    def append(self, test: 'Test'):
        self.tests.append(test)

    def make_id(self):
        return 'group_' + str(self.num)

    def render(self):
        with open(_default_group_template, "r") as tempfile:
            templatestring = tempfile.read()
        template = jinja2.Template(templatestring)
        return template.render(testgroup=self)

    def update_status(self, status):
        self.status = self.status and status


class TestSession:

    def __init__(self, code: str, **params):
        self.history: List[Union[Test, TestGroup]] = []
        self.last_test: Optional[Test] = None
        self.next_test: Test = Test(code)
        self.current_test_group: Optional[TestGroup] = None
        self.params = _default_params.copy()
        self.params.update(params)

    """Feedback management."""

    def begin_test_group(self, title: str) -> NoReturn:
        self.current_test_group = TestGroup(title)
        self.history.append(self.current_test_group)

    def end_test_group(self) -> NoReturn:
        if self.current_test_group and self.last_test:
            self.current_test_group.update_status(self.last_test.status)
        self.current_test_group = None
        self.last_test = None

    """Rendering"""

    def render(self):
        return "\n".join(test.render() for test in self.history)

    """Setters for next test description."""

    def set_title(self, title):
        self.next_test.title = title

    def set_descr(self, descr):
        self.next_test.descr = descr

    def set_hint(self, hint):
        self.next_test.hint = hint

    """Setters for execution context."""

    def exec_preamble(self, preamble: str, **kwargs) -> NoReturn:
        exec(preamble, self.next_test.current_state, **kwargs)
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
        if self.current_test_group and self.last_test:
            self.current_test_group.update_status(self.last_test.status)

        self.next_test.run(expression, **kwargs)
        self.last_test = self.next_test
        self.next_test = self.last_test.copy()

        # record last test
        if self.current_test_group:
            self.current_test_group.append(self.last_test)
        else:
            self.history.append(self.last_test)

        if self.params.get('fail_fast', False) and not self.last_test.status:
            raise StopGrader("Failed assert during fail-fast test.")

    """Assertions."""
    # TODO: unhappy about code duplication in assertion mechanism, fix this.

    def assert_output(self, expected,
                      cmp: Callable = lambda x, y: x == y):
        if self.last_test is None:
            raise GraderError("Can't assert before running the code.")
        status = self.last_test.assert_output(expected, cmp)
        if self.params.get('fail_fast', False) and not status:
            self.end_test_group()
            raise StopGrader("Failed assert during fail-fast test.")

    def assert_result(self, expected,
                      cmp: Callable = lambda x, y: x == y):
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
            return "Affichage attendu : {!r}".format(self.expected)


class NoExceptionAssert(Assert):
    def __init__(self, status, **params):
        super().__init__(status, params)

    def __str__(self):
        if self.status:
            return "Aucune exception levée"
        else:
            return "Exception anormale"


class ExceptionAssert(Assert):
    def __init__(self, status, exception: Exception, **params):
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

