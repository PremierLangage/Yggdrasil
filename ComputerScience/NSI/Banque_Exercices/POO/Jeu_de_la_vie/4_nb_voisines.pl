extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode nombre de voisines vivantes

text==

Ecrire la méthode `nb_voisines` de la classe `Jeu_de_la_vie` ayant comme 
paramètre une cellule et 
renvoyant le nombre de cellules **vivantes** voisines.

On pourra bien entendu utiliser les méthodes précédentes.

    >>> cell.i, cell.j # cell est une cellule existante
    (0, 0)
    >>> jeu.nb_voisines(cell) 
    0 # cell n'a donc aucune voisine vivante

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

class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.taille = taille
        self.plateau = [[Cellule(False, i, j) for j in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True

    def voisines(self, cell):
        i, j = cell.i, cell.j
        lst = [(i - 1, j - 1), (i, j - 1), (i + 1, j - 1), (i - 1, j), (i + 1, j), (i - 1, j + 1), (i, j + 1), (i + 1, j + 1)]
        res = []
        for x, y in lst:
            if x >= 0 and x < self.taille and y >= 0 and y < self.taille:
                res.append(self.plateau[x][y])
        return res
==


editor.code==

==

pltest==
>>> Jeu_de_la_vie.nb_voisines = nb_voisines #
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)]) #
>>> cell1 = jeu.plateau[0][0] #
>>> cell2 = jeu.plateau[4][3] #
>>> jeu.nb_voisines(cell1)
0
>>> jeu.nb_voisines(cell2)
3
==

soluce==
def nb_voisines(self, cellule):
    cpt = 0
    for cell in self.voisines(cellule):
        if cell.vivant:
            cpt += 1
    return cpt
==

