# OCE : test 11/09/2019 OK

# author=DR
title= Initialisation d'une variable (1).

tag=variable|affectation 

extends=/AAAA/dominique/python/template/pltest2023.pl
#extends=/ComputerScience/python/template/pltest.pl
@ /utils/sandboxio.py

text==

Créer trois variables **pim**  **pam** et **pom** contenant respectivement 1 2 et 3.

==

code==
pim,pam,pom=0,0,0
==

before=

# comme ça: cela se passera bien
pltest==
>>> pim # Pim vaut un
1
>>> pam == pam  #
True
>>> pam # Verifions la valeur de pam
2
>>> pom
3
==


pltest1==
>>> pim == 2
False
==



stopfirsterror=True
