# Test d'une classe Graphe implémentant un graphe orienté non pondéré.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Graphe orienté non pondéré
text==
Écrivez une classe GrapheOriente implémentant un graphe orienté non pondéré.
==



# Les tests:

# Vérifications basiques de la classe Graphe
testname0 = Vérifications basiques de la classe Graphe
# Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
pltest0== 
>>> G = GrapheOriente()  # Existence d'une classe GrapheOriente
>>> G.ajouter_arcs([(0, 2), (1, 0), (1, 2), (2, 3), (3, 1)])  # Ajout d'arcs
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[0, 1, 2, 3]
>>> sorted(map(list, G.arcs())) # Vérification de l'ensemble des arcs
[[0, 2], [1, 0], [1, 2], [2, 3], [3, 1]]
>>> sorted((v, sorted(G.successeurs(v))) for v in G.sommets()) # Vérification des successeurs
[(0, [2]), (1, [0, 2]), (2, [3]), (3, [1])]
>>> sorted((v, sorted(G.predecesseurs(v))) for v in G.sommets()) # Vérification des prédécesseurs
[(0, [1]), (1, [3]), (2, [0, 1]), (3, [2])]
>>> sorted((v, G.degre_entrant(v)) for v in G.sommets())  # Degrés entrants
[(0, 1), (1, 2), (2, 1), (3, 1)]
>>> sorted((v, G.degre_sortant(v)) for v in G.sommets())  # Degrés sortants
[(0, 1), (1, 1), (2, 2), (3, 1)]
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






