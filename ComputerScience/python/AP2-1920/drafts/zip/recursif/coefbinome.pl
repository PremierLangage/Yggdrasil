
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
Ecrire une fonction ``binome(n,p)`` qui renvoie $%\binom{n}{p}%$.
Cette fonction esr particulièrement innefficace : elle calcule plusieurs fois les mêmes valeurs!<br>
On décide de garder ces valeurs déjà calculées  dans un dictionnaire pour ne pas les recalculer.<br>
Ecrire une fonction ``binomedico(n,p)`` qui renvoie $%\binom{n}{p}%$ en utilisant un dictionnaire.<br>
Utiliser python our comparer le temps d'execution de binome(30,18) et de binomedico(30,18).
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
ltest1==
>>> binomedico(14,3)
364
==

pltest2==
>>> from rectest import test_recursion
>>> test_recursion(lambda:binomedico(13,5))
True
==



