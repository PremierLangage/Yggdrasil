# OCE : test 11/09/2019 OK

# author=DR
title= Initialisation d'une variable (1).

tag=variable|affectation 

extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

Créer trois variables pim pam et pom contenant respectivement 1 2 et 3.

==

code==
pim,pam,pom=0,0,0
==

# comme ca cela se passera bien
pltest==
>>> pim # Pim vaut un
1
>>> pam == pam  #
True
>>> pam
2
>>> pom
3
==






