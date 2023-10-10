extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode futur état

text==

Ecrire la méthode `futur_etat` de la classe `Cellule` ayant comme 
paramètre le nombre de ses voisins et modifiant son attribut `futur`en suivant
la règle suivante :

- une cellule morte possédant exactement trois voisines vivantes devient vivante : elle naît ;
- une cellule vivante possédant deux ou trois voisines vivantes le reste, sinon elle meurt.

On pourra bien entendu utiliser les méthodes précédentes.

    >>> cell.vivant
    False
    >>> cell.futur_etat(3)
    >>> cell.futur
    True

==

befor ==
import os
import time

class Cellule:
    def __init__(self, etat):
        self.vivant = etat
        self.futur = None

class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.taille = taille
        self.plateau = [[Cellule(False) for i in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True

    def voisines(self, i, j):
        lst = [(i - 1, j - 1), (i, j - 1), (i + 1, j - 1), (i - 1, j), (i + 1, j), (i - 1, j + 1), (i, j + 1), (i + 1, j + 1)]
        res = []
        for x, y in lst:
            if x >= 0 and x < self.taille and y >= 0 and y < self.taille:
                res.append(self.plateau[x][y])
        return res

    def nb_voisines(self, i, j):
        cpt = 0
        for cell in self.voisines(i, j):
            if cell.vivant:
                cpt += 1
        return cpt
==


editor.code==

==

pltest==
>>> Cellule.futur_etat = futur_etat #
>>> cell = Cellule(True) #
>>> cell2 = Cellule(False) #
>>> cell.futur_etat(2)
>>> cell.futur
True
>>> cell.futur_etat(1)
>>> cell.futur
False
>>> cell.futur_etat(4)
>>> cell.futur
False
>>> cell2.futur_etat(4)
>>> cell2.futur
False
>>> cell2.futur_etat(3)
>>> cell2.futur
True
==

soluce==
def futur_etat(self, nb):
    if not self.vivant and nb == 3:
        self.futur = True
    if self.vivant and nb >= 2 and nb <=3:
        self.futur = True
    else:
        self.futur = False
==


