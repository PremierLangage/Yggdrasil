# Test d'une classe Tas implémentant une file à priorité.
@ /utils/sandboxio.py
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

author = Anthony Labarre
title = Tas
text = Écrivez une classe Tas implémentant une file à priorité.
taboo = heapq

# Les tests:

# Vérification du fonctionnement sur des entiers
pltest0==
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [randint(-100, 100) for _ in range(10)]; T = Tas()
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction != elem:
...         print("attendu:", elem, ", obtenu:", extraction)
==

# Vérification du fonctionnement sur des triplets (premier élément = critère pour le minimum)
pltest1==
>>> # création d'une liste de triplets aléatoires
>>> from random import randint; donnees = [(randint(-100, 100), randint(-100, 100), randint(-100, 100)) for _ in range(10)]; T = Tas()
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction[0] != elem[0]:
...         print("attendu: un triplet avec première valeur =", elem[0], ", obtenu: un triplet avec première valeur =", extraction[0])
==


# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"bravo")
==

#
# création de l'éditeur de code
editor.code ==
class Tas(object):
    """Implémentation de la structure de données Tas."""
    def __init__(self):
        """Initialisation des structures de données nécessaires."""
        pass  # à compléter

    def inserer(self, element):
        """Insère un élément dans le tas en préservant la structure."""
        pass  # à compléter

    def extraire_minimum(self):
        """Extrait et renvoie le minimum du tas en préservant sa structure."""
        pass  # à compléter

==


