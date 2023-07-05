
extends = /ComputerScience/python/template/pltest.pl


title = Un tout petit peu de python

text==
Ecrire une fonction Som(n) qui retourne la somme des n premiers nombre.

Exemple:

Som(3) retourne 6.

==

stopfirsterror= True

pltest1==
>>> Som(3) == 6
True
>>> Som(4) == 10
True
==
pltest2==
>>> Som(5) == 15
True
==
pltest3==
>>> import random #
>>> a=random.randint(80,100) #
>>> Som(a)== (a*(a+1))//2
True
==

solution==

def Som(n):
    s = 0
    for i in range(0,n+1):
        s += i
    return s 

==

stopfirsterror = True