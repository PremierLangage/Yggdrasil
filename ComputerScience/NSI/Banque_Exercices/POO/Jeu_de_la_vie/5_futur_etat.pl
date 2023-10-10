extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode futur état

text==

Ecrire la méthode `futur_etat` de la classe `Cellule` ayant comme 
paramètre le nombre de ses voisins et modifiant son attribut `futur`en suivant
la règle suivante :

- une cellule morte possédant exactement trois voisines vivantes devient vivante : elle naît ;
- une cellule vivante possédant deux ou trois voisines vivantes le reste, sinon elle meurt.

On pourra bien entendu utiliser les méthodes précédentes.

    >>> cell.vivant # cell existe
    False # cell est morte
    >>> cell.futur_etat(3) # je calcule son futur etat si son nombre de voisines vivantes est 3
    >>> cell.futur # après application de la méthode, son etat futur est alors True
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
>>> Cellule.futur_etat = futur_etat #
>>> cell = Cellule(True, 1, 1) #
>>> cell2 = Cellule(False, 2, 2) #
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
    if (not self.vivant) and nb == 3:
        self.futur = True
    elif self.vivant and nb >= 2 and nb <=3:
        self.futur = True
    else:
        self.futur = False
==


