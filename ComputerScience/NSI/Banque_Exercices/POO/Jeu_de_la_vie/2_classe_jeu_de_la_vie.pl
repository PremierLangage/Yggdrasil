extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Classe Jeu de la Vie 

text==

Ecrire la classe `Jeu_de_la_vie` ayant deux attributs:

- `plateau` : liste de `n` liste de `n` cellules (instances 
de la classe `Cellule`) 
- `taille` : le nombre de cellules sur un côté du plateau (il est carré)

Son constructeur aura comme paramètres:

- le nombre `n` de cellules sur un côté du plateau (il est carré)
- une liste des coordonnées des cellules vivantes initialement.

On créera un jeu avec le code suivant:

    >>> Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)])


Ce dernir devrait correspondre au plateau suivant (0 pour mort, 1 pour vivant):

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

class Cellule:
    def __init__(self, etat, i, j):
        self.vivant = etat
        self.futur = None
        self.i = i
        self.j = j
==


editor.code==
==

pltest==
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)])
>>> jeu.plateau[3][4].vivant
True
>>> jeu.plateau[4][3].vivant
False
>>> jeu = Jeu_de_la_vie(7, [(1, 0)])
>>> jeu.plateau[1][0].vivant
True
>>> jeu.plateau[3][4].vivant
False
>>> jeu.taille
7
==

soluce==
class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.taille = taille
        self.plateau = [[Cellule(False, i, j) for j in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True
==