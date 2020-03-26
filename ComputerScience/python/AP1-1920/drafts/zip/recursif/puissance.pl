
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =Puissance 
text==
En utilisant la définition $%a^n=a \times a ldots \times a] nfacteurs%$ et $%a^0=1%$
écrire une fonction puissance(a,n) qui renvoie la valeur $%a^n%$
==

before==
from random import *

n=randint(4,12)
a=randint(-5,10)
def puissance(a,n):
    if n:
        return a*puissance(a,n-1)
    return 1

ff=puissance(a,n)

pltest3 = f"""
>>> puissance({a,n})=={ff}
True
"""

after=before
==



pltest0==

>>> puissance(2,4)
16
==
pltest1==
>>> from rectest import test_recursion
>>> test_recursion(lambda:puissance(3,5))
True
==

pltest2==
>>> puissance(2,15)
32768
==
