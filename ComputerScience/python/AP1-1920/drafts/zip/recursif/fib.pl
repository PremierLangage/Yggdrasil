
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =Factorielle
text==
Ecrire une fonction  récursive qui reçoit un entier positif n et renvoie la valeur $%n%$

<pre><code>
>>facto(2)
2
</code></pre>
==
editor.code==
def facto(n):
    if n:
        return n*facto(n-1)
    return 1
==
before==


import random

n=random.randint(4,12)

def facto(n):
    if n:
        return n*facto(n-1)
    return 1

ff=facto(n)

pltest3 = f"""
>>> facto({n})=={ff}
True
"""

after=before
==



pltest0==

>>> facto(4)
24
==
pltest1==
>>> from rectest import test_recursion
>>> test_recursion(lambda:facto(5))
True
==

pltest2==
>>> facto(10)
3628800
==













