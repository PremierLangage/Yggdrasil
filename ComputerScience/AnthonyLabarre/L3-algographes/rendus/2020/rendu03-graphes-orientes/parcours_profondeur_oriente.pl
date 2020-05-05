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

# TODO: graphe aléatoire
testname1 = Vérifications de detection_cycle sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> arcs_cycle_trouve = set(detection_cycle(G).arcs())
>>> cycles_possibles = cycles_simples(G)
>>> if arcs_cycle_trouve not in cycles_possibles:
...     print("les arcs identifiés:", arcs_cycle_trouve, "ne constituent pas un cycle du graphe")
...     print("cycles possibles:", cycles_possibles)
==

testname2 = Vérifications de detection_cycle sur un DAG aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_acyclique_aleatoire(20).edges())) # initialisation d'un DAG aléatoire
>>> obtenu = detection_cycle(G)
>>> if obtenu is not None:
...     print("la fonction identifie le cycle", obtenu.arcs(), " mais le graphe est acyclique")
...     print("ses arcs:", G.arcs())
==

testname3 = Vérifications de detection_cycle sur un graphe orienté aléatoire
pltest3==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(list(graphe_oriente_aleatoire(20).edges())) # initialisation d'un graphe orienté aléatoire
>>> obtenu = detection_cycle(G)
>>> cycles_possibles = cycles_simples(G)
>>> if obtenu is None:
...     if cycles_possibles:
...         print("la fonction ne trouve pas de cycle alors que le graphe en contient", len(cycles_possibles))
... else:
...     if cycles_possibles:
...         if arcs_cycle_trouve not in cycles_possibles:
...             print("les arcs identifiés:", arcs_cycle_trouve, "ne constituent pas un cycle du graphe")
...             print("cycles possibles:", cycles_possibles)
...     else:
...         print("la fonction identifie le cycle", obtenu.arcs(), " mais le graphe est acyclique")
...         print("ses arcs:", G.arcs())
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


