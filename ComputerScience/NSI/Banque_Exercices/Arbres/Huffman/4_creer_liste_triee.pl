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

==

pltest==
>>> occurences = creer_occurences("c'est un test")
>>> occurences_triees = creer_liste_triée(occurences)
>>> occurences_triees[0].valeur
3
>>> occurences_triees[0].lettre
't'
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

