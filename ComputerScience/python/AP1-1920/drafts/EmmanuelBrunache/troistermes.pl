author= Emmanuel

# comment
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

title = Suites géométriques

text == 
Soit $%(u_n)%$ la suite définie par $%u_{n+1}=q\times u_n%$ et $%u_{n_0}=b%$
Réaliser une fonction s'appelent "suite" qui prend 4 nombres $%q%$, $%n_0%$, $%b%$ et $%n%$ et qui retourne le n-ième terme de la suite
==

before==
from math import random
def suite(a,b,c,d):
    return c*a**(d-b)
a=randint(10,100)
b=randint(10,100)
c=randint(10,100)
d=randint(10,100)
pltest1=""">>>suite({},{},{},{})\n{}\n""".format(a,b,c,d,suite(a,b,c,d))
after=before
==
taboo=import

pltest==

==



