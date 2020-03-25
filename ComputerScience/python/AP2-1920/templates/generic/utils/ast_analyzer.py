import ast
import inspect
from typing import Callable


class LoopFoundError(Exception):
    pass


class ForLoopFoundError(LoopFoundError):
    pass


class WhileLoopFoundError(LoopFoundError):
    pass


class LoopVisitor(ast.NodeVisitor):
    def visit_For(self, node):
        raise ForLoopFoundError()

    def visit_While(self, node):
        raise WhileLoopFoundError()


class CallVisitor(ast.NodeVisitor):
    def __init__(self):
        self.calls = []

    def visit_Call(self, node):
        if isinstance(node.func, ast.Name):
            self.calls.append(node.func.id)


def has_no_loop(code):
    visitor = LoopVisitor()
    tree = ast.parse(code)
    try:
        visitor.visit(tree)
    except LoopFoundError as e:
        print(e)
        return False
    return True


def calls(code, funcname):
    visitor = CallVisitor()
    tree = ast.parse(code)
    visitor.visit(tree)
    return funcname in visitor.calls


def is_simple_recursive(func: Callable):
    return calls(inspect.getsource(func), func.__name__)


def f(n):
    if n <= 1:
        return 1
    else:
        return n * f(n-1)


if __name__ == "__main__":
    from textwrap import dedent

    code_for = dedent("""
    for i in range(5):
        print(i)
    """)

    code_while = dedent("""
    i = 0
    while i < 5:
        print(i)
        i += 1
    """)

    code_without_loop = 'print("Hello world!")'

    code_rec = dedent("""
    def f(n):
        if n <= 1:
            return 1
        else:
            return n * f(n-1)
    """)

    print(has_no_loop(code_for),
          has_no_loop(code_while),
          has_no_loop(code_without_loop))

    print(calls(code_rec, "f"))

    print(is_simple_recursive(f), is_simple_recursive(calls))

