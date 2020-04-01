
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =Puissances
text==
En utilisant la définition $%a^n=a \times a \ldots \times a, nfacteurs%$ et $%a^0=1%$<br>

écrire une fonction recursive ``puissance(a,n)`` qui renvoie la valeur $%a^n%$<br>
En utilisant la définition <br>
$%a^0=1%$<br>
$%a^n=(a^\frac{n}{2})^2%$ si n est pair<br>
$%a^n=a*(a^\frac{n}{2})^2%$ si n est impair<br>
écrire une fonction recursive ``puissancer``(a,n) qui renvoie la valeur $%a^n%$<br>
En transformant la fonction `puissance(a,n)`,<br>
écrire une fonction recursive ``nbpuissance(a,n)`` qui renvoie un couple formé de 
la valeur $%a^n%$ et du nombre d'appels récursifs.,<br>
En transformant la fonction `puissancer(a,n)`,<br>
écrire une fonction recursive n``bpuissancer(a,n)`` qui renvoie un couple formé de 
la valeur $%a^n%$ et du nombre d'appels récursifs.==
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


def nbpuissance(a,n):
    nb=0    
    if n:
        (p,rec)=nbpuissance(a,n-1)
        p=p*a
        nb=1+rec
        return (p,nb)
    return (1,0)

def nbpuissancer(a,n):
    if n==0:
        return (1,0)
    (p,r)=nbpuissancer(a,n//2)
    p*=p
    if n%2==1:
        p*=a
    return (p,r+1)


n=randint(4,12)
a=randint(-5,10)
ff=puissance(a,n)

pltest4 = f"""
>>> puissance{a,n}=={ff}
True
"""
n=randint(20,40)
fs=puissancer(a,n)

pltest5 = f"""
>>> puissancer{a,n}=={fs}
True
"""
n=randint(4,12)
a=randint(-5,10)
ff=nbpuissancer(a,n)

n=randint(4,12)
a=randint(-5,10)
ff=nbpuissance(a,n)

pltest8 = f"""
>>> nbpuissance{a,n}=={ff}
True
"""
n=randint(20,40)
fs=nbpuissancer(a,n)

pltest9 = f"""
>>> nbpuissancer{a,n}=={fs}
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
>>> from rectest import test_recursion
>>> test_recursion(lambda:puissance(3,5))
True
==

pltest3==
>>> puissance(2,15)
32768
==
pltest6==
>>> from rectest import test_recursion
>>> test_recursion(lambda:nbpuissance(3,5))
True
==
pltest7==
>>> from rectest import test_recursion
>>> test_recursion(lambda:nbpuissancer(3,5))
True
==





