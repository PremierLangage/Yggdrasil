import sys
from copy import deepcopy
from io import StringIO
from typing import NoReturn, List, Any, Callable
from unittest import mock

import testfeedback as fb
from mockinput import mock_input


def new_variables(previous, current) -> dict:
    return {var: current[var] for var in current.keys() - previous.keys()}


def deleted_variables(previous, current) -> List[str]:
    return list(previous.keys() - current.keys())


def modified_variables(previous, current, cmp=lambda x, y: x == y) -> dict:
    return {var: previous[var] for var in previous.keys() & current.keys()
            if not cmp(previous[var], current[var])}


def unchanged_variables(previous, current, cmp=lambda x, y: x == y) -> dict:
    return {var: previous[var] for var in previous.keys() & current.keys()
            if cmp(previous[var], current[var])}


class CodeRunner:
    """Code runner for Python exercises.

    Instances store a piece of student code.
    Provides methods for code execution, simulating standard input and output
    if necessary and keeping track of global state changes.
    """

    def __init__(self, code: str):
        """Build CodeRunner object.

        :param code: student code to evaluate.
        """
        self.code = code

        # execution context
        self.previous_state = {}
        self.current_state = {}
        self.previous_inputs = []
        self.current_inputs = []
        self.argv = []
        self.output = ""
        self.exception = None
        self.result = None

        # history and feedback
        self.tests = []  # List[Union[fb.TestGroup, fb.TestFeedback]]
        self.current_test_group = None

    def copy(self):
        r = CodeRunner(self.code)
        r.previous_state = deepcopy(self.previous_state)
        r.current_state = deepcopy(self.current_state)
        r.previous_inputs = self.previous_inputs.copy()
        r.current_inputs = self.current_inputs.copy()
        r.argv = self.argv.copy()
        r.output = self.output
        r.result = deepcopy(self.result)
        return r

    """Setters for execution context."""

    def exec_preamble(self, preamble: str, **kwargs) -> NoReturn:
        exec(preamble, self.current_state, **kwargs)
        del self.current_state['__builtins__']

    def set_globals(self, **variables) -> NoReturn:
        self.previous_state = None
        self.current_state.update(variables)
        self.record_test(fb.SetGlobalsFeedback(variables))

    def set_state(self, state: dict) -> NoReturn:
        self.previous_state = None
        self.current_state = state
        self.record_test(fb.SetStateFeedback(state))

    def set_argv(self, argv: List[str]) -> NoReturn:
        self.argv = argv.copy()
        self.record_test(fb.SetArgvFeedback(argv))

    def set_inputs(self, inputs: List[str]) -> NoReturn:
        self.current_inputs = inputs.copy()
        self.record_test(fb.SetInputsFeedback(inputs))

    """Feedback management."""

    def begin_test_group(self, title: str) -> NoReturn:
        self.current_test_group = fb.TestGroup(title)
        self.tests.append(self.current_test_group)

    def end_test_group(self) -> NoReturn:
        self.current_test_group = None

    def record_test(self, test: fb.TestFeedback) -> NoReturn:
        if self.current_test_group:
            self.current_test_group.append(test)
            if test.status == fb.FAIL:
                self.current_test_group.status = fb.FAIL
        else:
            self.tests.append(test)

    def render_tests(self):
        return "\n".join(test.render() for test in self.tests)

    """Code execution."""

    def summarize_changes(self):
        # TODO: cache results if clean
        deleted = deleted_variables(self.previous_state, self.current_state)
        modified = modified_variables(self.previous_state, self.current_state)
        added = new_variables(self.previous_state, self.current_state)

        n = len(self.previous_inputs) - len(self.current_inputs)
        inputs = self.previous_inputs[:n]

        return added, deleted, modified, inputs

    def run(self) -> NoReturn:
        """
        Run the student code with the specified lines of input available on
        standard input.

        :return: String printed on standard output, modified state.
        """
        self.previous_state = deepcopy(self.current_state)
        self.previous_inputs = self.current_inputs.copy()
        self.exception = None
        out_stream = StringIO()

        # run the code while mocking input, sys.argv and stdout printing
        with mock_input(self.current_inputs, self.current_state):
            with mock.patch.object(sys, 'argv', self.argv):
                with mock.patch.object(sys, 'stdout', out_stream):
                    try:
                        exec(self.code, self.current_state)
                    except Exception as e:
                        self.exception = e

        # cleanup final state for feedback
        del self.current_state['__builtins__']
        # store generated output
        self.output = out_stream.getvalue()

        added, deleted, modified, inputs = self.summarize_changes()
        self.record_test(
            fb.ExecutionFeedback(deleted, modified, added,
                                 inputs, self.output, self.exception))

    def evaluate(self, expression: str) -> Any:
        """
        Evaluate the provided expression in the context of the student's code,
        with the specified lines of input available on standard input.

        :param expression: expression to be evaluated.
        :return: the expression's value.
        """
        self.previous_state = deepcopy(self.current_state)
        self.previous_inputs = self.current_inputs.copy()
        self.exception = None
        out_stream = StringIO()

        # evaluate the expression while mocking input, sys.argv and stdout
        # printing
        with mock_input(self.current_inputs, self.current_state):
            with mock.patch.object(sys, 'argv', self.argv):
                with mock.patch.object(sys, 'stdout', out_stream):
                    try:
                        self.result = eval(expression, self.current_state)
                    except Exception as e:
                        self.exception = e

        # cleanup final state for feedback
        del self.current_state['__builtins__']
        # store generated output
        self.output = out_stream.getvalue()

        added, deleted, modified, inputs = self.summarize_changes()
        self.record_test(
            fb.EvaluationFeedback(expression, self.result,
                                  deleted, modified, added,
                                  inputs, self.output, self.exception))

    """Assertions."""

    def assert_output(self, expected,
                      cmp: Callable = lambda x, y: x == y):
        status = fb.PASS if cmp(expected, self.output) else fb.FAIL
        self.record_test(fb.OutputTestFeedback(status, expected))

    def assert_result(self, expected,
                      cmp: Callable = lambda x, y: x == y):
        status = fb.PASS if cmp(expected, self.result) else fb.FAIL
        self.record_test(fb.ResultTestFeedback(status, expected))

    def assert_variable_values(self, cmp=lambda x, y: x == y, **expected):
        if not expected:
            return
        missing = deleted_variables(expected, self.current_state)
        incorrect = modified_variables(expected, self.current_state, cmp)

        status = fb.FAIL if missing or incorrect else fb.PASS
        self.record_test(fb.VariableValuesTestFeedback(
            status, expected, missing, incorrect))

    def assert_no_global_change(self):
        added, deleted, modified, _ = self.summarize_changes()
        status = fb.FAIL if added or deleted or modified else fb.PASS
        self.record_test(fb.NoGlobalChangeTestFeedback(status))

    def assert_no_exception(self):
        status = self.exception is None
        self.record_test(fb.NoExceptionTestFeedback(status))

    def assert_exception(self, exception_type):
        status = isinstance(self.exception, exception_type)
        self.record_test(fb.ExceptionTestFeedback(status, exception_type))

