# OCE : test 11/09/2019 OK

author=Yohan Rameau
title= Exercice de test.
tag=test

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

Créer un tableau de 

==

code==
pim,pam,pom=0,0,0
==

# comme ca cela se passera bien
pltest==
>>> pim # Pim vaut un
1
>>> "pam" in globals() #
True
>>> pam
2
>>> pom
3
==



