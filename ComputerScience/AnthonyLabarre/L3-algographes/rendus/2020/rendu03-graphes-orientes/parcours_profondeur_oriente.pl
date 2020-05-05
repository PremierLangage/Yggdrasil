# Test d'une fonction parcours_profondeur_oriente.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Parcours en profondeur (graphe orienté).
text==
Écrivez une fonction parcours_profondeur_oriente(graphe), qui renvoie les sommets du graphe dans l'ordre où le parcours en profondeur les découvrira. Attention, votre fonction doit être correcte que le graphe soit ou non connexe (faiblement ou fortement). Tous les sommets du graphe doivent donc être listés.
==

# Les tests:
# TODO: exemples des TDs, graphe aléatoire fortement connexe, graphe aléatoire faiblement connexe:
# pour la vérification: 





testname0 = Vérifications de parcours_profondeur_oriente sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import CYCLE_ORIENTE_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cycle = detection_cycle(G)
>>> sorted(cycle.arcs())
[(0, 3), (3, 4), (4, 0)]
==

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


