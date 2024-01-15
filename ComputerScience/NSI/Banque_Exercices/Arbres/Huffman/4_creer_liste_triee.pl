extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl


title= Liste de feuilles triées

text==

Ecrire la fonction `creer_liste_triee(occurences)` ayant en entrée un dictionnaire des 
occurences des lettres et retournant une liste de feuilles (de la classe `Feuille`) triées de
la lettre la plus fréquente à la moins fréquente

    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> occurences_triees[0].valeur
    3
    >>> occurences_triees[0].lettre
    't'

==

before== #|python| 
from solution import *
from random import choice, randint, seed
val = randint(1, 100)
pltest += f"""
>>> b = Arbre({val})
>>> b.valeur
{val}
"""
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
>>> occurences_triees = creer_liste_triee(occurences)
>>> occurences_triees[0].valeur
3
>>> occurences_triees[0].lettre
't'
==

soluce==
def creer_liste_triee(occurences):
    lst = []
    while len(occurences) != 0:
        m = -1
        for k, v in occurences.items():
            if v > m:
                m = v
                km = k
        lst.append(Feuille(km, m))
        del occurences[km]
    return lst
==

