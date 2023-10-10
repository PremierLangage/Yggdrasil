extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Classe Cellule 

text==

Ecrire la classe `Cellule` ayant 4 attributs : 

- `vivant` de type booléen correspondant à l'état de la cellule
- `futur` de type booléen correspondant à l'état suivant de la cellule après calcul.
- `i` son numéro de ligne
- `j` son numéro de ligne

Son constructeur aura trois paramètres:

- l'état initial de la cellule. 
- son numéro de ligne et son numéro de colonne.

L'attribut `futur` sera mis à None initialement

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
>>> cell = Cellule(True, 0, 0)
>>> cell.vivant
True
>>> cell2 = Cellule(False, 1, 3)
>>> cell2.vivant
False
>>> cell2.futur
>>> cell2.i
1
==

soluce==
class Cellule:
    def __init__(self, etat, i, j):
        self.vivant = etat
        self.futur = None
        self.i = i
        self.j = j
==