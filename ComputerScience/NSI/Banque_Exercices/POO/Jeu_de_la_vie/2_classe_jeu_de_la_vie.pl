extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Classe Jeu de la Vie 

text==

Ecrire la classe `Jeu_de_la_vie` ayant un seul attribut `plateau`: liste de `n` liste 
de `n` cellules (instances de la classe `Cellule`) ainsi que son constructeur comme 
paramètres:

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
    def __init__(self, etat):
        self.vivant = etat
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
==

soluce==
class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.plateau = [[Cellule(False) for i in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True
==