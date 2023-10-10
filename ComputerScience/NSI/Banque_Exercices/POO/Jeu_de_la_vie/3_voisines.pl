extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode voisines

text==

Ecrire la méthode `voisines` de la classe `Jeu_de_la_vie` ayant comme 
paramètres `i` le numéro de ligne et `j` le numéro de colonne et 
renvoyant une liste des cellules voisines.

    >>> jeu.voisines(0,0)
    []

==

befor ==
import os
import time

class Cellule:
    def __init__(self, etat):
        self.vivant = etat

class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.taille = taille
        self.plateau = [[Cellule(False) for i in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True
==


editor.code==
==

pltest==
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)])
>>> jeu.voisines = voisines
>>> jeu.voisines(0,0)
True
>>> jeu.voisines(1,0)
False
==

soluce==
def voisines(self, i, j):
    lst = [(i - 1, j - 1), (i, j - 1), (i + 1, j - 1), (i - 1, j), (i + 1, j), (i - 1, j + 1), (i, j + 1), (i + 1, j + 1)]
    res = []
    for x, y in lst:
        if x >= 0 and x < self.taille and y >= 0 and y < self.taille:
            res.append(self.plateau[x][y])
    return res
==
