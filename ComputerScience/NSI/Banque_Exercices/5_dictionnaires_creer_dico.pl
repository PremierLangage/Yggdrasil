


# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Créer un dictionnaire

text==

Ecrire une fonction ``arithmetique(a,b)`` qui prend en paramètres deux entiers et renvoie un dictionnaire
dont les clés sont ``'somme'``, ``'produit'`` et ``'bien ordonnes'``, avec pour valeurs associées respectives la somme de
``a`` et ``b``, le produit de ``a`` et ``b`` et un booléen indiquant si ``a`` est plus petit que (ou égal à) ``b``.
==

tag=dictionary

samplesol==
def arithmetique(a,b):
    return {'somme': a+b, 'produit': a*b, 'bien ordonnes': a<=b}
==

before==
==

pltest0==
>>> arithmetique(10,3)  # Test simple 1
{'somme': 13, 'produit': 30, 'bien ordonnes': False}
>>> arithmetique(1,3)  # Test simple 2
{'somme': 4, 'produit': 3, 'bien ordonnes': True}
==

pltest1==
>>> arithmetique(-11,3)  # Test Avec Négatifs
{'somme': -8, 'produit': -33, 'bien ordonnes': True}
>>> arithmetique(-2,-2)  # Test Nombres Egaux
{'somme': -4, 'produit': 4, 'bien ordonnes': True}
==




