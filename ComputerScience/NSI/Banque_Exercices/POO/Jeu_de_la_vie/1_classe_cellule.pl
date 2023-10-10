extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Classe Cellule 

text==

Ecrire la classe `Cellule` ayant deux attributs : 

- `vivant` de type booléen correspondant à l'état de la cellule
- `futur` de type booléen correspondant à l'état suivant de la cellule après calcul.

Son constructeur aura un seul paramètre l'état initial de la cellule. L'attribut `futur`sera mis à None initialement

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
>>> cell2.vivant
False
>>> cell2.futur
==

soluce==
class Cellule:
    def __init__(self, etat):
        self.vivant = etat
        self.futur = None
==