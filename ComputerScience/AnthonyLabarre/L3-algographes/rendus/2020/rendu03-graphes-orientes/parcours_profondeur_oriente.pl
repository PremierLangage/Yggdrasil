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
# pour la vérification: attention, on ne leur impose plus les sommets de départ
# comment vérifier?
# 



# pas d'exemple intéressant fait au cours, on passe directement sur l'exercice du TD
testname0 = Vérifications de parcours_profondeur_oriente sur l'exemple du TD
pltest0==
>>> from corrlib_graphes import * #
>>> G = GrapheOriente(); G.ajouter_arcs(CYCLE_ORIENTE_INSTANCE_TD) # initialisation de l'instance du TD
>>> foret = parcours_profondeur_oriente(G)
>>> foret.sommets() == G.sommets()  # tous les sommets sont-ils couverts?
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


