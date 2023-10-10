extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode voisines

text==

Ecrire la méthode `voisines` de la classe `Jeu_de_la_vie` ayant comme 
paramètre une cellule et renvoyant une liste des cellules voisines.

    >>> cell.i, cell.j
    (0, 0)
    >>> len(jeu.voisines(cell))
    3
    >>> jeu.voisines(cell)[0].vivant
    False

==

befor ==
import os
import time

class Cellule:
    def __init__(self, etat):
        self.vivant = etat
        self.futur = None
        self.i = i
        self.j = j

class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.taille = taille
        self.plateau = [[Cellule(False, i, j) for j in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True
==


editor.code==
def voisines(self,...
==

pltest==
>>> Jeu_de_la_vie.voisines = voisines #
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)]) #
>>> cell1 = jeu.plateau[0][0] #
>>> cell2 = jeu.plateau[1][0] #
>>> cell1 = jeu.plateau[6][6] #
>>> len(jeu.voisines(cell1)) # test nombre de voisins
3
>>> len(jeu.voisines(cell2)) # test nombre de voisins
5
>>> len(jeu.voisines(cell3)) # test nombre de voisins
3
>>> jeu.voisines(cell3)[0].vivant
False
==

soluce==
def voisines(self, cell):
    i, j = cell.i, cell.j
    lst = [(i - 1, j - 1), (i, j - 1), (i + 1, j - 1), (i - 1, j), (i + 1, j), (i - 1, j + 1), (i, j + 1), (i + 1, j + 1)]
    res = []
    for x, y in lst:
        if x >= 0 and x < self.taille and y >= 0 and y < self.taille:
            res.append(self.plateau[x][y])
    return res
==
