# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Arbres (et forêts) couvrants de poids minimum
text==
Écrivez une classe Graphe implémentant un graphe pondéré non orienté.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Les tests:

# Vérifications basiques de la classe Graphe
testname0 = Vérifications basiques de la classe Graphe
# Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
pltest0== 
>>> G = Graphe()  # Existence d'une class Graphe
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])  # Ajout d'arêtes pondérées
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[0, 1, 2, 3]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification de l'ensemble des arêtes
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes()) # Vérification de l'ensemble des poids
[-2, -1, 2, 3, 4]
>>> from corrlib_graphes import PRIM_INSTANCE_TD #
>>> G.ajouter_aretes(PRIM_INSTANCE_TD) # Ajout d'arêtes  (indices non consécutifs)
>>> sorted(G.sommets()) # Vérification des sommets (indices non consécutifs)
[0, 1, 2, 3, 17, 18, 19, 20, 21, 22, 23]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification des arêtes (indices non consécutifs)
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2], [17, 18, 4], [17, 20, 3], [17, 21, 1], [17, 22, 8], [18, 19, 7], [18, 20, 2], [18, 21, 3], [19, 21, 8], [19, 22, 5], [19, 23, 4], [20, 21, 6], [21, 22, 9], [21, 23, 6], [22, 23, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes())  # Vérification de l'ensemble des poids (indices non consécutifs)
[-2, -1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6, 7, 8, 8, 9]
==

# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==
grade=(100,"bravo")
==

# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==


