author = Marie-Pierre Béal

extends = /ComputerScience/python/AP1-1920/templates/pltest.pl

@ /builder/before.py [builder.py]

title = module au carré

taboo = import|for|while

text == 
Ecrire une fonction f qui prend deux arguments x et y 
et calcule le module au carré du vecteur (x,y)
{{pltest}}
==
pltest==
>>> f(1,1)
2
==

before ==
from random import randint
def f(x,y):
    return x*x + y*y
n = randint(10,100)
m = randint(10,100)
pltest1 = """>>> f({},{})\n{}\n""".format(n,m,f(n,m))
after = before
==


editor.code==
def f(r,t):
    return 2
    
==
