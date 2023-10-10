extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode mise à jour état

text==

Ecrire la méthode `maj_etat` de la classe `Cellule` n'ayant aucun paramètre et faisant passer l'attribut `vivant` à la valeur de l'attribut `futur`.

On pourra bien entendu utiliser les méthodes précédentes.

    >>> cell.vivant
    False
    >>> cell.futur
    True
    >>> cell.maj_etat()
    >>> cell.vivant
    True

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

    def futur_etat(self, nb):
        if (not self.vivant) and nb == 3:
            self.futur = True
        elif self.vivant and nb >= 2 and nb <=3:
            self.futur = True
        else:
            self.futur = False

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
    
    def nb_voisines(self, cellule):
        cpt = 0
        for cell in self.voisines(cellule):
            if cell.vivant:
                cpt += 1
        return cpt
==


editor.code==

==

pltest==
>>> Cellule.maj_etat = maj_etat #
>>> cell = Cellule(True, 0, 0) #
>>> cell.futur = False #
>>> cell2 = Cellule(False, 1, 1) #
>>> cell2.futur = True #
>>> cell.maj_etat()
>>> cell.vivant
False
>>> cell2.maj_etat()
>>> cell2.vivant
True
==

soluce==
def maj_etat(self):
    self.vivant = self.futur
==



