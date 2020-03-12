from contextlib import contextmanager
from typing import Union, List


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