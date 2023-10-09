extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Classe Jeu de la Vie 

text==

Ecrire la classe `Jeu_de_la_vie` ayant un seul attribut `plateau`: liste de `n` liste de `n` cellules (instances de la classe `Cellule`) ainsi que son constructeur comme paramètres:
- le nombre `n` de cellules sur un côté du plateau (il est carré)
- une liste des coordonnées des cellules vivantes initialement.

On créera un jeu avec le code suivant:

    >>> Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)])


Ce dernir devrair correspondre au plateau suivant:

    0 0 0 0 0 0 0
    0 0 0 0 0 0 0
    0 0 0 0 0 0 0
    0 0 0 0 1 0 0
    0 0 0 0 1 0 0
    0 0 0 0 1 0 0
    0 0 0 0 0 0 0
    
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
==

soluce==
class Cellule:
    def __init__(self, etat):
        self.vivant = etat
==
