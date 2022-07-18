extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Liste composée

text==

Ecrire une fonction `create` à deux paramètres qui retourne un tuple composée des deux paramètres.

Par exemple, l'appel `create(3,4)` doit renvoyer le tuple `(3, 4)`.
==

tag=listCreate

samplesol==
# solution
def create(d1,d2) :
    return d1, d2
==

pltest0==
>>> create(2,"4")
(2, '4')
>>> create(3.14,"titi")
(3.14, 'titi')
==

pltest1==
>>> import random #
>>> a, b = random.randint(1,10), random.randint(1,10) #
>>> create(a,b) == (a,b)
True
==

