extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl
@ /builder/before.py [builder.py]
@ solution.py

title= Classe Arbre 

text==

Ecrire la classe `Arbre` ayant 3 attributs : 

- `valeur` de type quelconque correspondant à la valeur (l'étiquette) du noeud
- `droite` de type Nonetype (initialement), Arbre ou Feuille correspondant au sous-arbre droit
- `gauche` de type Nonetype (initialement), Arbre ou Feuille correspondant au sous-arbre gauche

Son constructeur aura un paramètre:

- la valeur du noeud 

Les attributs `droite` et `gauche` seront mis à None initialement.

On créera un Arbre avec le code suivant:

    >>> Arbre(3) # Arbre sans fils ayant pour étiquette 3

==

befor ==
import os
import time
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

editor.code==
==

pltest==
>>> a = Arbre(3)
>>> a.gauche = Arbre(2)
>>> a.valeur
3
>>> a.gauche.valeur
2
>>> a.droite
==

soluce==
class Arbre:
    def __init__(self, valeur):
        self.valeur = valeur
        self.droite = None
        self.gauche = None
==
