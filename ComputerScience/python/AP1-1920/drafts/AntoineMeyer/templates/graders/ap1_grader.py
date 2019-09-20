#!/usr/bin/env python3
#
# Authors:
#   Quentin Coumes <coumes.quentin@gmail.com>
#   Antoine Meyer <antoine.meyer@u-pem.fr>

# TODO: separate test result information from feedback formatting
# TODO: handle exceptions in student code
# TODO: allow easy / easier translation of feedback
# TODO: implement fail-fast mechanism
# TODO: check whether other stuff should be mocked (notably stderr) and possibly
#  use a new patch-decorated function

import sys
from contextlib import contextmanager
from copy import deepcopy
from io import StringIO
from typing import NoReturn, List, Any, Callable, Union
from unittest import mock


class Test:
    def __init__(self, title: str, status: bool):
        self.title = title
        self.status = status

    def __str__(self):
        msg = "[OK] " if self.status else "[KO] "
        return msg + self.title


class TestGroup:
    def __init__(self, title: str):
        self.title = title
        self.tests = []

    def __str__(self):
        res = self.title + '\n'
        res += "\n".join(str(test) for test in self.tests)
        return res

    def append(self, test_or_test_group: Union[Test, 'TestGroup']):
        self.tests.append(test_or_test_group)


def default_cmp(x, y):
    return x == y


class InputMocker:
    """Can be use to replace the 'input()' built-in function so that it returned
    predefined inputs.

    Inputs can either be a list of string (without '\n') or one string (will
    be split at '\n').

    If verbose is set, InputMocker will act like input() by printing the
    prompt. It will also print the input as if it was entered by the user.

    Example:
    >>> input = InputMocker(["Line 1", "Line 2"])
    >>> input()
    'Line 1'
    >>> input()
    'Line 2'
    >>> input()
    Traceback (most recent call last):
    ...
    EOFError: No input to be read
    >>> input = InputMocker("Line 1\\nLine 2")
    >>> input()
    'Line 1'
    >>> input()
    'Line 2'

    With verbose=True:
    >>> input = InputMocker(["Line 1", "Line 2", "Line 3"], verbose=True)
    >>> input("Enter a line: ")
    Enter a line: Line 1
    'Line 1'
    >>> s = input("Enter a line: ")
    Enter a line: Line 2
    >>> s
    'Line 2'
    >>> input()
    Line 3
    'Line 3'


    Using eval():
    >>> context = {'__builtins__': {'input': InputMocker(["Line 1"])}}
    >>> eval('input()', context)
    'Line 1'

    Using exec():
    >>> context = {'__builtins__': {'input': InputMocker(["Line 1"])}}
    >>> exec("l = input()", context)
    >>> context['l']
    'Line 1'
    """

    def __init__(self, inputs: Union[str, List[str]], verbose: bool = False):
        if isinstance(inputs, str):
            inputs = inputs.split('\n')
        self.inputs = inputs
        self.verbose = verbose

    def __call__(self, prompt: str = "") -> str:
        try:
            in_str = self.inputs.pop(0)
            if self.verbose:
                print(prompt + in_str)
            return in_str
        except IndexError:
            raise EOFError("No input to be read")


@contextmanager
def mock_input(inputs: Union[str, List[str]], context=None,
               verbose: bool = False) -> dict:
    """Calls to input() done in this context manager will return the given
    inputs.

    If verbose will be passed to InputMocker.

    Modifies globals() by default, you can provide an optional context to
    modify it instead so it can be given to exec() or globals().

    The mocking is done by adding / modifying the 'input' key for the
    duration of the context manager.

    Example (globals() is given because of the way doctest handle it):
    >>> with mock_input(["Line 1", "Line 2"], globals()):
    ...     input()
    ...     input()
    'Line 1'
    'Line 2'

    >>> with mock_input("Line 1\\nLine 2", globals()):
    ...     input()
    ...     input()
    'Line 1'
    'Line 2'

    Using eval():
    >>> with mock_input(["Line 1"], globals()):
    ...     eval("input()")
    'Line 1'

    Using exec():
    >>> l = None
    >>> with mock_input(["Line 1"], globals()):
    ...     exec("l = input()")
    ...     l
    'Line 1'

    Using a custom context:
    >>> with mock_input(["Line 1"], {}) as context:
    ...     eval("input()", context)
    'Line 1'
    """
    if context is None:
        context = globals()
    old_input = context['input'] if 'input' in context else None
    context['input'] = InputMocker(inputs, verbose)

    try:
        yield context
    finally:
        if old_input is None:
            del context['input']
        else:
            context['input'] = old_input


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
        self.previous_state = None
        self.current_state = {}
        self.inputs = []
        self.argv = []
        self.output = None
        self.result = None

        # history and feedback
        self.tests = TestGroup("main test group")
        self.test_group_stack = []

    """Setters for execution context."""

    def exec_preamble(self, preamble: str, **kwargs) -> NoReturn:
        exec(preamble, self.current_state, **kwargs)
        del self.current_state['__builtins__']

    def set_globals(self, **kwargs) -> NoReturn:
        self.previous_state = None
        self.current_state.update(kwargs)

    def set_state(self, state: dict) -> NoReturn:
        self.previous_state = None
        self.current_state = state

    def set_argv(self, argv: List[str]) -> NoReturn:
        self.argv = argv

    def set_inputs(self, inputs: List[str]) -> NoReturn:
        self.inputs = inputs

    """Feedback management."""

    def begin_test_group(self, title: str) -> NoReturn:
        tg = TestGroup(title)
        if self.test_group_stack:
            self.test_group_stack[-1].append(tg)
        else:
            self.tests.append(tg)
        self.test_group_stack.append(tg)

    def end_test_group(self) -> NoReturn:
        self.test_group_stack.pop()

    def record_test(self, test: Test) -> NoReturn:
        if self.test_group_stack:
            self.test_group_stack[-1].append(test)
        else:
            self.tests.append(test)

    """Code execution."""

    def run(self) -> NoReturn:
        """
        Run the student code with the specified lines of input available on
        standard input.

        :return: String printed on standard output, modified state.
        """
        self.previous_state = deepcopy(self.current_state)
        out_stream = StringIO()

        with mock_input(self.inputs, self.current_state):
            with mock.patch.object(sys, 'argv', self.argv):
                with mock.patch.object(sys, 'stdout', out_stream):
                    exec(self.code, self.current_state)

        # cleanup final state for feedback
        del self.current_state['__builtins__']

        # store generated outputs
        self.output = out_stream.getvalue()

    def evaluate(self, expression: str) -> Any:
        """
        Evaluate the provided expression in the context of the student's code,
        with the specified lines of input available on standard input.

        :param expression: expression to be evaluated.
        :return: the expression's value.
        """
        self.previous_state = deepcopy(self.current_state)
        out_stream = StringIO()

        # evaluate the expression mocking sys.argv and stdout printing
        with mock_input(self.inputs, self.current_state):
            with mock.patch.object(sys, 'argv', self.argv):
                with mock.patch.object(sys, 'stdout', out_stream):
                    self.result = eval(expression, self.current_state)

        # cleanup final state for feedback
        del self.current_state['__builtins__']

        # store generated outputs
        self.output = out_stream.getvalue()

    """Assertions."""

    def assert_output(self, output, _cmp=default_cmp) -> NoReturn:
        status = _cmp(output, self.output)

        msg = "assert_output: "
        if status:
            msg += "got correct output {}".format(repr(output))
        else:
            msg += "expected {}, got {}".format(repr(output), repr(self.output))

        self.record_test(Test(msg, status))

    def assert_result(self, value, _cmp: Callable = default_cmp):
        status = _cmp(value, self.result)

        msg = "assert_result: "
        if status:
            msg += "got correct result {}".format(repr(value))
        else:
            msg += "expected {}, got {}".format(repr(value), repr(self.result))

        self.record_test(Test(msg, status))

    def assert_variable_values(self, _cmp: Callable = default_cmp, **kwargs):
        missing_variables = []
        incorrect_msg_list = []

        for ident, value in kwargs.items():
            if ident not in self.current_state:
                missing_variables.append(ident)
            elif not _cmp(value, self.current_state[ident]):
                incorrect_msg_list.append(
                    "{} has value {} (should be {})".format(
                        ident, self.current_state[ident], value))

        msg = "assert_variable_values: "
        msg_list = []
        status = True
        if missing_variables:
            status = False
            msg_list.append("variable(s) {} missing".format(
                ", ".join(missing_variables)))
        if incorrect_msg_list:
            status = False
            msg_list.append("; ".join(incorrect_msg_list))
        if status:
            msg_list.append("; ".join("{} has value {}".format(ident, value)
                            for ident, value in kwargs.items()))
        msg += "; ".join(msg_list)

        self.record_test(Test(msg, status))

    def assert_no_global_change(self) -> NoReturn:
        modified_vars = [
            var for var in self.previous_state
            if var not in self.current_state
            or self.current_state[var] != self.previous_state[var]]

        modified_vars.extend(self.current_state.keys() -
                             self.previous_state.keys())

        msg = "assert_no_global_change: "
        status = len(modified_vars) == 0
        if status:
            msg += "no changed variables"
        else:
            msg += "changed variables: {}".format(modified_vars)

        self.record_test(Test(msg, status))


class GraderError(Exception):
    pass


if __name__ == "__main__":
    import inspect
    import sandboxio

    # determine editor's HTML id
    ex_context = sandboxio.get_context()
    print(ex_context["editor"].cid, file=sys.stderr)
    """
    if "editor" not in ex_context or "cid" not in ex_context["editor"]:
        raise GraderError("Unable to identify the code editor's key. Please "
                          "make sure a CodeEditor component is defined in the "
                          "current exercise (in variable `editor`).")
    editor_id = ex_context["editor"]["cid"]

    # determine student code
    answers = sandboxio.get_answers()
    student_code = answers["editor_id"]

    # determine validation script
    validation_script = ex_context["grader"]

    r = CodeRunner(student_code)
    methods = inspect.getmembers(r, predicate=inspect.ismethod)
    globals().update(methods)

    try:
        exec(validation_script, globals())
    except Exception as e:
        print(e)
    
    sandboxio.output(0, str(r.tests))
    """

