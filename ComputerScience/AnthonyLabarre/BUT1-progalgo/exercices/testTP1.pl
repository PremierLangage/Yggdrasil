extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
title= caluler une somme dans une variable
text==
En supposant qu'il existe déjà 2 variables x et y, écrire le code qui met leur somme dans une variable nommée s.
==

before==

import random 

x,y = 40,2
result = x+y
==

@ /builder/before.py [builder.py]
pltest==
>>> s == s # La variable existe  ?
True
>>> s == result # s a pour valeur x+y
==
