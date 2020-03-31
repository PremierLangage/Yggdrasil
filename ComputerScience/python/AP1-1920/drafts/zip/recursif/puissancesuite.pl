
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =Puissances nombre d'appels 
text==
En transformant la fonction `puissance(a,n)` de l'exercice précédent,
écrire une fonction recursive nbpuissance(a,n) qui renvoie un couple formé de 
la valeur $%a^n%$ et du nombre d'appels récursifs.
En utilisant la définition <br>
$%a^0=1%$<br>
$%a^n=(a^\frac{n}{2})^2%$ si n est pair<br>
$%a^n=a*(a^\frac{n}{2})^2%$ si n est impair<br>
ecrire une fonction recursive puissancer(a,n) qui renvoie la valeur $%a^n  \binom{1 }{7}%$
==

before==
from random import *


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
ff=nbpuissancer(a,n)

n=randint(4,12)
a=randint(-5,10)
ff=nbpuissance(a,n)

pltest4 = f"""
>>> nbpuissance{a,n}=={ff}
True
"""
n=randint(20,40)
fs=nbpuissancer(a,n)

pltest5 = f"""
>>> nbpuissancer{a,n}=={fs}
True
"""

after=before
==



pltest0==

>>> nbpuissance(2,4)
(16, 4)
>>> nbpuissancer(2,6)
(64, 3)

==


pltest1==
>>> from rectest import test_recursion
>>> test_recursion(lambda:nbpuissance(3,5))
True
==
pltest2==
>>> from rectest import test_recursion
>>> test_recursion(lambda:nbpuissancef(3,5))
True
==

