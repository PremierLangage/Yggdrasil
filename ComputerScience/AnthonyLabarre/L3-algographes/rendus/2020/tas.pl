# Test d'une classe Tas implémentant une file à priorité.
@ /utils/sandboxio.py
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

author = Anthony Labarre
title = Tas
text = Écrivez une classe Tas implémentant une file à priorité.
#taboo = heapq

# Les tests:

# Vérification du fonctionnement sur des entiers
pltest0==
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [randint(0, 100) for _ in range(10)]; T = Tas()
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
....    assert T.extraire_minimum() == elem
==

# Vérification du fonctionnement sur des triplets (premier élément = critère pour le minimum)


# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"bravo")
==

#
# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==


