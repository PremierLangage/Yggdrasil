# Test d'une classe Tas implémentant une file à priorité.
@ /utils/sandboxio.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Tas
text==
Écrivez une classe Tas implémentant une file à priorité.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==
taboo=heapq


# Les tests:

# Vérification de la classe Tas sur des entiers
testname1 = Vérification de la classe Tas sur des entiers
pltest1== 
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [randint(-100, 100) for _ in range(10)] #
>>> try:
...     T = Tas()  # initialisation sans paramètre
... except TypeError:
...     T = Tas([])  # initialisation avec un itérable
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction != elem:
...         print("attendu:", elem, ", obtenu:", extraction)
==

# Vérification de la classe Tas sur des triplets (premier élément = critère pour le minimum)

testname2 = Vérification de la classe Tas sur des triplets (premier élément = critère pour le minimum)
pltest2==
>>> from random import randint; donnees = [(randint(-100, 100), randint(-100, 100), randint(-100, 100)) for _ in range(10)] #
>>> try:
...     T = Tas()  # initialisation sans paramètre
... except TypeError:
...     T = Tas([])  # initialisation avec un itérable
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
# Complétez le code ci-dessous, et cliquez sur le bouton de validation quand vous avez terminé
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










