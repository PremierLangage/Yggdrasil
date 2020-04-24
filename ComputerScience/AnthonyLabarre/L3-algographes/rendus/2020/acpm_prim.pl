# Test d'une fonction acpm_prim.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Prim - Arbres couvrants de poids minimum: Prim sur un graphe connexe.
text==
Écrivez une fonction acpm_prim(graphe, sommet), qui prend en paramètres un graphe et un sommet de départ et renvoie un ACPM pour la composante connexe du sommet donné en suivant l'algorithme de Prim.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Les tests:

# Vérifications de acpm_prim sur un graphe connexe
testname0 = Vérifications de acpm_prim sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import *; from random import choice #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation de l'instance du cours
>>> arbre = acpm_prim(G, choice(list(G.sommets()))) # lancement de acpm_prim avec départ aléatoire
>>> sum(poids for *_, poids in arbre.aretes())  # vérification du poids de la solution
23
>>> if not est_arbre_couvrant(arbre, G):
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets()))
...     if not est_arbre(arbre):
...         print("l'arbre trouvé n'est pas un arbre")
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())):
...             print("certaines extrémités d'arêtes ne sont pas des sommets")
==

testname1 = Vérifications de acpm_prim sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import PRIM_INSTANCE_COURS, from random import choice #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation de l'exemple du TD
>>> arbre = acpm_prim(G, choice(list(G.sommets())) # lancement de acpm_prim avec départ aléatoire
>>> sum(poids for *_, poids in arbre.aretes())
18
==

testname2 = Vérifications de acpm_prim sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)) # initialisation d'une instance aléatoire
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> arbre = acpm_prim(G, choice(list(G.sommets())); poids_obtenu = sum(poids for *_, poids in arbre.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
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










