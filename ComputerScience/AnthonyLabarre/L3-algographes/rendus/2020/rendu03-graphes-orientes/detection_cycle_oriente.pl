# Test d'une fonction detection_cycle.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Détection de cycle (graphe orienté).
text==
Écrivez une fonction detection_cycle(graphe), renvoyant explicitement un cycle du graphe orienté passé en paramètre s'il en contient un et None sinon. Le type du cycle renvoyé doit être le même que celui du graphe en entrée.
==

# Les tests:
testname0 = Vérifications de detection_cycle sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import CYCLE_ORIENTE_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cycle = detection_cycle(G)
>>> sorted(cycle.arcs())
[(0, 3), (3, 4), (4, 0)]
==


# TODO: exemple TD, DAG aléatoire, graphe aléatoire
testname1 = Vérifications de composantes_fortement_connexes sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import CYCLE_ORIENTE_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> cycle = detection_cycle(G)
>>> sorted(map(sorted, cfc))
[[1, 2, 3], [4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
==

testname2 = Vérifications de composantes_fortement_connexes sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_aleatoire(20).edges())) # initialisation d'une instance aléatoire
>>> attendu = sorted(map(sorted, cfc(G)))
>>> obtenu = sorted(map(sorted, composantes_fortement_connexes(G)))
>>> if obtenu != attendu:
...     print("CFC obtenues =", obtenu, ";\n CFC attendues =", attendu)
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

















