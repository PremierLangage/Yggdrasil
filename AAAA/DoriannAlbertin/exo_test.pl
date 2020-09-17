# OCE : test 11/09/2019 OK

author=Albertin
title= Project Euler 1

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

Ecrire une fonction f qui à un entier n revoie la somme des entiers positifs strictement inférieurs à n qui ne soient multiples ni de 3 ni de 5.
Votre fonction doit fonctionner pour $$n = 10^9$$.

==

code==
def f(n):
    n5 = (n-1)//5
    n3 = (n-1)//3
    n15 = (n-1)//15
    return int((5*n5*(n5+1) + 3*n3*(n3+1) - 15*n15*(n15+1))/2)
==


# comme ca cela se passera bien
pltest==
>>> f(10)
23
>>> f(113)
2954
>>> f(300)
20850
>>> f(10**9) # f(1 000 000 000)
233333333166666656
==







