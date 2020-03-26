
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =Puissances
text==
En utilisant la définition $%a^n=a \times a ldots \times a] nfacteurs%$ et $%a^0=1%$
écrire une fonction recursive puissance(a,n) qui renvoie la valeur $%a^n%$
En utilisant la définition <br>
$%a^0=1%$<br>
$%a^n=(a^\frac{n}{2})^2%$ si n est pair<br>
$%a^n=a*(a^\frac{n}{2})^2%$ si n est impair<br>
ecrire une fonction recursive puissancer(a,n) qui renvoie la valeur $%a^n%$
==

before==
from random import *


def puissance(a,n):
    if n:
        return a*puissance(a,n-1)
    return 1

def puissancer(a,n):
    if n==0:
        return 1
    p=puissancer(a,n//2)
    p*=p
    if n%2==1:
        p*=a
return p

n=randint(4,12)
a=randint(-5,10)
ff=puissance(a,n)
n=randint(20,40)


pltest3 = f"""
>>> puissance{a,n}=={ff}
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
