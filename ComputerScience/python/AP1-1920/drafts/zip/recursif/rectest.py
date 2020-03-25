
from bdb import Bdb
import sys

def facto(n):
    if n:
        return n*facto(n-1)
    return 1
class RecursionDetected(Exception):
    pass

class RecursionDetector(Bdb):
    def do_clear(self, arg):
        pass

    def __init__(self, *args):
        self.stack = set()

    def user_call(self, frame, argument_list):
        code = frame.f_code
        if code in self.stack:
            raise RecursionDetected
        self.stack.add(code)

    def user_return(self, frame, return_value):
        self.stack.remove(frame.f_code)


def est_recursive(func):
    """Renvoie True si func effectue des appels récursifs, False sinon.
    """
 
    detector = RecursionDetector()
    # detector.set_trace()
    try:
        func()
    except RecursionDetected:
       print(True)
    else:
        print(False)


