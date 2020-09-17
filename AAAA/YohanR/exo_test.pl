# OCE : test 11/09/2019 OK

author=Yohan Rameau
title= Initialisation d'une variable.
tag=test

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

Créer un tableau de chiffres impair

==

code==
tableau = []
==

# comme ca cela se passera bien
pltest==
>>> def verification(tableau):
>>>    for elt in tableau:
>>>        if elt % 2 != 0:
>>>            return False
>>>    return True

>>> verification(tableau) == True

==





