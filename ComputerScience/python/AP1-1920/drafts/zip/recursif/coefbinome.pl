
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title =coefficient du binome
text==
En utilisant la définition :<br>
$%\binom{n}{0}=1%$ <br>
$%\binom{n}{n}=1%$ <br>
$%\binom{n}{p}=\binom{n-1}{p}+\binom{n-1}{p-1}1%$ pour $%0 \lt p \lt n%$ <br>
Cette fonnction esr particulièrement innefficace : elle calcule plusieurs fois les mêmes valeurs
On décide de garder ces valeurs déjà calculées  dans un dictionnaire pour ne pas les recalculer
==
before==
from random import *


def binome(n,p):
    if p==0 or p==n:
        return 1
    x=  binome(n-1,p)+binome(n-1,p-1)
    return x
def binomedico(n,p,dic={}):
    if (n,p) in dic:
        return dic[(n,p)]
    if p==0 or p==n:
        return 1
    x=  binomedico(n-1,p-1,dic)+binomedico(n-1,p,dic)
    dic[(n,p)]=x
    return x


==

pltest0==
>>> binome(4,2)
6
==

pltest1==
>>> from rectest import test_recursion
>>> test_recursion(lambda:binomedico(13,5))
True
==
pltest2==
>>> binomedico(13,5)
1287
==


