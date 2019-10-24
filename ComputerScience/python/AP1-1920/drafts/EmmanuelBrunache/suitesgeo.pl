author= Emmanuel

# comment
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Suites géométriques

text == 
Soit $%(u_n)%$ la suite définie par $%u_{n+1}=q\times u_n%$ et $%u_{n_0}=b%$\n
Réaliser une fonction s'appelant "suite" qui prend comme arguments 4 nombres $%q%$, $%n_0%$, $%b%$ et $%n%$ (dans cet ordre) et qui retourne le n-ième terme de cette suite.
==

before==
from random import randint
def suite(a,b,c,d):
    return c*a**(d-b)
a=randint(1,10)
b=randint(10,50)
c=randint(10,100)
d=randint(50,100)
pltest=""">>> suite({},{},{},{})\n{}\n""".format(a,b,c,d,suite(a,b,c,d))
after=before
==
taboo=import

pltest==

==




