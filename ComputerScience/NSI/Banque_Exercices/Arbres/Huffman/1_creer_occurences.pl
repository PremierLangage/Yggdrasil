extends = /ComputerScience/NSI/templates/pltest/pltest2023.pl
@ /builder/before.py [builder.py]
@ solution.py

title= Occurences caractères

text==

Écrire une fonction `creer_occurences(texte)` prenant en paramètre une chaine de 
caractères `texte` et retournant un dictionnaire sont les caractères de la chaine
et les valeurs sont le nombre d'occurences de ceux-ci.

Exemple:

    >>> creer_occurences("ceci est un essai")
    {'c': 2, 'e': 3, 'i': 2, ' ': 3, 's': 3, 't': 1, 'u': 1, 'n': 1, 'a': 1}

==

befor ==
import os
import time
==

before== #|python| 
from solution import *
from random import choice
texte = choice(textes)
texte = textes[2]
pltest1 = f"""
>>> texte = \"\"\"{repr(texte)}\"\"\"
>>> creer_occurences(texte)
{creer_occurences(str(texte))}
"""
==


editor.code==
==

pltest0==
>>> occ_dict = creer_occurences("ceci est un essai")
>>> occ_dict['c']
2
>>> occ_dict[' ']
3
==

soluce==
def creer_occurences(texte):
    d = {}
    for caractere in texte:
        d[caractere] = d.get(caractere, 0) + 1
    return d
==
