# Test d'une fonction composantes_fortement_connexes.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Composantes fortement connexes.
text==
Écrivez une fonction composantes_fortement_connexes(graphe), renvoyant les composantes fortement connexes d'un graphe orienté sous la forme d'un itérable d'itérables de sommets.
==

# Les tests:
testname0 = Vérifications de composantes_fortement_connexes sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import CFC_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cfc = composantes_fortement_connexes(G)
>>> sorted(map(sorted, cfc))
[[0, 1, 4], [2, 3], [5, 6], [7]]
==

testname1 = Vérifications de composantes_fortement_connexes sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import CFC_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du cours
>>> cfc = composantes_fortement_connexes(G)
>>> sorted(map(sorted, cfc))
[[1, 2, 3], [4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
==

testname2 = Vérifications de composantes_fortement_connexes sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_aleatoire(20).edges())) # initialisation d'une instance aléatoire

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

















