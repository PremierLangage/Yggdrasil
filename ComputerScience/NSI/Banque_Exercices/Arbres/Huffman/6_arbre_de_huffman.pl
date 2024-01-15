
extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl
@ /builder/before.py [builder.py]
@ solution.py

title= Arbre de huffman

text==

Ecrire la fonction `arbre_huffman(lst)` ayant en entrée `lst` : une liste d'arbres et de feuilles triée (où les valeurs des arbres ou des feuilles sont 
classés dans l'odre décroissant)

et qui réalise les actions suivantes:

    tant que lst n'a pas qu'un seul élément
        récupère les deux derniers noeuds (`Arbre` ou `Feuille`) de la liste (normalement ce sont ceux qui ont les valeurs les plus petites)
        crée un nouveau noeud (de la classe `Arbre`) dont la valeur est la somme des valeurs des deux noeuds récupérés et donc les fils sont les deux noeuds récupérés
        insère ce nouveau noeud dans la liste (on appellera la fonction insere de la question précédente (même si on ne l'a pas faite))

et qui retournera l'arbre résultant située au seul emplacement 0 de la liste `lst`. On appelle cet arbre arbre de Huffman.



    >>> occurences = creer_occurences("c'est un test")
    >>> occurences_triees = creer_liste_triee(occurences)
    >>> arbre_h = arbre_huffman(occurences_triees)
    >>> arbre_h.valeur
    13
    >>> arbre_h.droite.valeur
    8
    >>> arbre_h.gauche.valeur
    5

==

before== #|python| 
from solution import *
from random import choice, randint, seed
texte = choice(textes[1:])
occurences = creer_occurences(texte)
occurences_triees = creer_liste_triee(occurences)
arbre_h = arbre_huffman(occurences_triees)
pltest += f"""
>>> occurences = creer_occurences({repr(texte)})
>>> occurences_triees = creer_liste_triee(occurences)
>>> arbre_h = arbre_huffman(occurences_triees)
>>> arbre_h.valeur
{arbre_h.valeur}
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

def insere(lst, noeud):
    if len(lst) != 0:
        i = len(lst) - 1
        while noeud.valeur > lst[i].valeur and i >= 0:
            i -= 1
        lst.insert(i + 1, noeud)  
    else:
        lst.insert(0, noeud)
==


editor.code==

==

pltest==
>>> occurences = creer_occurences("c'est un test")
>>> occurences_triees = creer_liste_triee(occurences)
>>> arbre_h = arbre_huffman(occurences_triees)
>>> arbre_h.valeur
13
>>> arbre_h.droite.valeur == 8 or arbre_h.droite.valeur == 5
True
==

soluce==
def arbre_huffman(lst):
    i = 0
    while len(lst) > 1:
        i += 1
        noeud1 = lst.pop()
        noeud2 = lst.pop()
        nouveau_noeud = Arbre(noeud1.valeur + noeud2.valeur)
        nouveau_noeud.gauche = noeud1
        nouveau_noeud.droite = noeud2
        insere(lst, nouveau_noeud)
    return lst[0]
==



