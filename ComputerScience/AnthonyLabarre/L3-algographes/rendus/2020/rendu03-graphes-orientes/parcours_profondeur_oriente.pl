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

# Les tests: exemples TD, graphe aléatoire
# TODO? graphe aléatoire fortement connexe, graphe aléatoire faiblement connexe

testname0 = Vérifications de parcours_profondeur_oriente sur l'exemple du TD 5 exercice 1
pltest0==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> sommets, parents = parcours_profondeur_oriente(G) # Appel de la fonction parcours_profondeur_oriente
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente) # Reconstruction de la forêt à partir de parents
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())#
>>> for arbre in cc_graphes(foret): # tous les sous-graphes de la forêt sont-ils des arbres?
...     if not est_arbre_oriente(arbre): #
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté")
...         print("    sommets:", arbre.sommets())
...         print("    arcs:   ", arbre.arcs())
...     ses_arcs = set(arbre.arcs())#
...     if not ses_arcs <= arcs_de_ma_foret:#
...         print("les arcs suivants ne devraient pas appartenir à la forêt:", ses_arcs.difference(arcs_de_ma_foret))
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__) #
>>> if sommets != ordre_attendu: # Vérification de l'ordre des sommets renvoyés par parcours_profondeur_oriente
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
==

testname1 = Vérifications de parcours_profondeur_oriente sur l'exemple du TD 5 exercice 3
pltest1==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du TD
>>> sommets, parents = parcours_profondeur_oriente(G)
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente)
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())
>>> for arbre in cc_graphes(foret): # tous les sous-graphes de la forêt sont-ils des arbres?
...     if not est_arbre_oriente(arbre):
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté")
...         print("    sommets:", arbre.sommets())
...         print("    arcs:   ", arbre.arcs())
...     ses_arcs = set(arbre.arcs())
...     if not ses_arcs <= arcs_de_ma_foret:
...         print("les arcs suivants ne devraient pas appartenir à la forêt:", ses_arcs.difference(arcs_de_ma_foret))
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__)
>>> if sommets != ordre_attendu:
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
==

testname2 = Vérifications de parcours_profondeur_oriente sur un graphe orienté aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(graphe_oriente_aleatoire(10).edges()) # initialisation d'un graphe orienté aléatoire
>>> sommets, parents = parcours_profondeur_oriente(G)
>>> foret = reconstruire_arbre_oriente(sommets, parents, GrapheOriente)
>>> sorted(foret.sommets()) == sorted(G.sommets())  # tous les sommets sont-ils couverts?
True
>>> ma_foret = foret_parcours_profondeur_oriente(G); arcs_de_ma_foret = set(ma_foret.arcs())
>>> for arbre in cc_graphes(foret): # tous les sous-graphes de la forêt sont-ils des arbres?
...     if not est_arbre_oriente(arbre):
...         print("le sous-graphe suivant de la forêt n'est pas un arbre orienté")
...         print("    sommets:", arbre.sommets())
...         print("    arcs:   ", arbre.arcs())
...     ses_arcs = set(arbre.arcs())
...     if not ses_arcs <= arcs_de_ma_foret:
...         print("les arcs suivants ne devraient pas appartenir à la forêt:", ses_arcs.difference(arcs_de_ma_foret))
>>> dates_attendues = profondeur_dates_fin(G); ordre_attendu = sorted(dates_attendues, key=dates_attendues.__getitem__)
>>> if sommets != ordre_attendu:
...     print("ordre attendu:", ordre_attendu) 
...     print("ordre obtenu: ", sommets) 
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



