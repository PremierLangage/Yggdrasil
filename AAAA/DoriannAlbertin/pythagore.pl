author=Albertin
title= Project Euler 9

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

On appelle triplet pythagoricien tout triplet (a,b,c) d'entiers strictement positifs vérifiant $$a^2 + b^2 = c^2.$$
Par exemple, (3,4,5) est un triplet pythagoricien car $$ 3^2 + 4^2 = 25 = 5^2 $$.
Ecrire une fonction P1000 sans argument qui renvoie un triplet pythagoricien de somme 1000.

==

code==
def P1000():
    for a in range(1,500):
        for b in range(1,500):
            c = 1000-a-b
            if a**2+b**2==c**2:
                return(a,b,c)
==


# comme ca cela se passera bien
pltest==
>>> (a,b,c) = P1000();(a + b + c == 1000 and a**2 + b**2 == c**2)
True

==

