extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Liste de feuilles triées

text==

Ecrire la fonction `creer_liste_triée(occurences)` ayant en entrée un dictionnaire des 
occurences des lettres et retournant une liste de feuilles (de la classe `Feuille`) triées de
la lettre la plus fréquente à la moins fréquente



    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triée(occurences)
    >>> occurences_triees[0].valeur
    3
    >>> occurences_triees[0].lettre
    't'

==

befor ==
def creer_occurences(texte):
    d = {}
    for caractere in texte:
        d[caractere] = d.get(caractere, 0) + 1
    return d

class Feuille:
    def __init__(self, lettre, valeur):
        self.valeur = valeur
        self.lettre = lettre

class Arbre:
    def __init__(self, valeur):
        self.valeur = valeur
        self.droite = None
        self.gauche = None
==


editor.code==
def voisines(self,...
==

pltest==
>>> Jeu_de_la_vie.voisines = voisines #
>>> jeu = Jeu_de_la_vie(7, [(3, 4), (4, 4), (5, 4)]) #
>>> cell1 = jeu.plateau[0][0] #
>>> cell2 = jeu.plateau[1][0] #
>>> cell3 = jeu.plateau[6][6] #
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

