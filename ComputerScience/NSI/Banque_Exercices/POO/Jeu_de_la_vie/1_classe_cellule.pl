extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Distribution 

text==

Ecrire la classe `Cellule` ayant un seul attribut `vivant` de type booléen ainsi que son constructeur ayant un seul paramètre l'état initial de la cellule.

On créera une cellule avec le code suivant:

    >>> Cellule(True)

==

befor ==
import os
import time
==


editor.code==
==

pltest==
>>> cell = Cellule(True)
>>> cell.vivant
True
>>> cell2 = Cellule(False)
>>> cell.vivant
False
==
