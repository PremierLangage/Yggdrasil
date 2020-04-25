# Authors:
#   Anthony Labarre <anthony.labarre@u-pem.fr>


# Classes et fonction permettant de vérifier si une fonction donnée est
# récursive (source: https://stackoverflow.com/a/36663046)
from bdb import Bdb
from sys import settrace


class RecursionDetected(Exception):
    pass


class RecursionDetector(Bdb):
    def do_clear(self, arg):
        pass

    def __init__(self, *args):
        Bdb.__init__(self, *args)
        self.stack = set()

    def user_call(self, frame, argument_list):
        code = frame.f_code
        if code in self.stack:
            raise RecursionDetected
        self.stack.add(code)

    def user_return(self, frame, return_value):
        self.stack.remove(frame.f_code)


def performs_recursion(runnable):
    """Renvoie True si runnable effectue des appels récursifs, False sinon.
    Fonctionne aussi pour des fonctions indirectement récursives, et en
    particulier la récursivité croisée, même si la fonction effectue des
    appels récursifs infinis.

    >>> def non_rec(n):
    ...     return n
    ...
    >>> performs_recursion(lambda: non_rec(10))
    False

    >>> def a(n):
    ...     return a(n-1)
    ...
    >>> performs_recursion(lambda: a(10))
    True

    >>> def b(n):
    ...     return c(n-1)
    ...
    >>> def c(n):
    ...     return b(n-1)
    ...
    >>> performs_recursion(lambda: b(10))
    True

    >>> def d(n):
    ...     if n: return d(n-1)
    ...
    >>> performs_recursion(lambda: d(1))
    True
    >>> performs_recursion(lambda: d(0))
    False
    """
    detector = RecursionDetector()
    detector.set_trace()
    try:
        runnable()
    except RecursionDetected:
        return True
    else:
        return False
    finally:
        settrace(None)

