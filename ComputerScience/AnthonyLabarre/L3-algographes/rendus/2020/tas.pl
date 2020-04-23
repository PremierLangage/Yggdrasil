# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Arbres (et forêts) couvrants de poids minimum
text==
Écrivez: 
<ul>
<li>une classe Graphe implémentant un graphe pondéré non orienté
<li>une classe Tas implémentant une file à priorité
<li>une classe UnionFind
<li>acpm_prim(graphe, sommet), qui prend en paramètres un graphe et un sommet de départ et renvoie un ACPM pour la composante connexe du sommet donné en suivant l'algorithme de Prim;
<li>acpm_kruskal(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Kruskal;
<li>fcpm_prim(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Prim.
</ul>
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==


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
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==









