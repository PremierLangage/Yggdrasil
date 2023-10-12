extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Méthode affiche

text==

Ecrire la méthode `affiche` de la classe `Jeu_de_la_vie` n'ayant aucun paramètre et 
effacant le terminal et affichant la plateau en utilisant des 1 pour les cellules vivantes
et de 0 pour les cellules mortes

On pourra bien entendu utiliser les méthodes précédentes.

    >>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)]) #
    >>> jeu.affiche()
    0000000
    0000000
    0000000
    0000100
    0000100
    0000100
    0000000

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

    def maj_etat(self):
        self.vivant = self.futur

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
    
    def tour(self):
        for ligne in self.plateau:
            for cellule in ligne:
                cellule.futur_etat(self.nb_voisines(cellule))
        for ligne in self.plateau:
            for cellule in ligne:
                cellule.maj_etat()
==


editor.code==
def affiche(self):
    try:
        os.system('cls')
        os.system('clear')
    except:
        pass
    ...
==

pltest==
>>> Jeu_de_la_vie.affiche = affiche #
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)]) #
>>> jeu.affiche()
0000000
0000000
0000000
0000100
0000100
0000100
0000000
==

soluce==
def affiche(self):
    try:
        os.system('cls')
        os.system('clear')
    except:
        pass
    def remp(ligne):
        l =[]
        for cell in ligne:
            if cell.vivant:
                l.append("1")
            else:
                l.append("0")
        return l
    res = [ ''.join(remp(ligne)) for ligne in self.plateau]
    res = '\n'.join(res)
    print(res)
==





