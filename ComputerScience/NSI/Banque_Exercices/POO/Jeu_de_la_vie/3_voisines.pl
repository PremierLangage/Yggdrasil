extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode voisines

text==

Ecrire la méthode `voisines` de la classe `Jeu_de_la_vie` ayant comme 
paramètres `i` le numéro de ligne et `j` le numéro de colonne et 
renvoyant une liste des cellules voisines

==

befor ==
import os
import time

class Cellule:
    def __init__(self, etat):
        self.vivant = etat

class Jeu_de_la_vie:
    def __init__(self, taille, liste_vivantes):
        self.plateau = [[Cellule(False) for i in range(taille)] for i in range(taille)]
        for i, j in liste_vivantes:
            self.plateau[i][j].vivant = True
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
