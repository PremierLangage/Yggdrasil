extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl
@ /builder/before.py [builder.py]
@ solution.py

title= Classe Feuille 

text==
La classe `Feuille` servira à stocker les lettres et leurs occurences dans un arbre de huffman.

Ecrire la classe `Feuille` ayant 2 attributs : 

- `lettre` de type `str` correspondant à un caractère.
- `valeur` de type entier correspondant à l'occuremce du caractère.


Son constructeur aura deux paramètres:

- la lettre de ce noeud feuille
- l'occurence (valeur) de la lettre 

On créera une Feuille avec le code suivant:

    >>> Feuille('c', 2) # Feuille 'c' d'occurence 2

==

befor ==
import os
import time
==

before== #|python| 
from solution import *
from random import choice, randint, seed
val = randint(1, 100)
lettre = 'abcdefghijklmnopqrstuvwxyz'[randint(0,23)]
pltest += f"""
>>> b = Feuille({lettre}, {val})
>>> b.lettre
{lettre}
>>> b.valeur
{val}
"""
==

editor.code==
==

pltest==
>>> a = Feuille('c', 2)
>>> a.lettre
'c'
>>> a.valeur
2
==

soluce==
class Feuille:
    def __init__(self, lettre, valeur):
        self.valeur = valeur
        self.lettre = lettre
==

