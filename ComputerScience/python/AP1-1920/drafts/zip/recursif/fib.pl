
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Factorielle
text==
Ecrire une fonction  récursive qui reçoit un entier positif n et renvoie la valeur $%n%$

<pre><code>
>>facto(2)
2
</code></pre>
==
code==
def facto(n):
    if n:
        return n*facto(n-1)
    return 1
==
before==

def fa(n):
    if n:
        return n*fa(n-1)
    return 1

class RecursionDetector():
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

 
    detector = RecursionDetector()
    #detector.set_trace()
    try:
        func()
    except RecursionDetected:
       print( True)
    else:
        print(False)
    finally:
        print(None)


import random

n=random.randint(4,12)


pltest3=""">>> ({})\n'{}'""".format(n, fa(n))

after=before
==



pltest0==
>>> facto(4)
24
==
pltest1==
>>>est_recursive(lambda:facto(5))
True
==

pltest2==
>>> facto(25==fa(25)
True
==










