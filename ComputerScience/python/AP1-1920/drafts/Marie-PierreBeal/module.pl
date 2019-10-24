author = Marie-Pierre Béal

extends = ../../templates/pltest.pl

builder = /builder/befor.py

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
import random
def f(x,y):
    return x*x + y*y
n = randint(10,100)
m = randint(10,100)
pltest1 = """>>>f({},{})\n{}\n""".format(n,m,f(n,m))
after = before
==



