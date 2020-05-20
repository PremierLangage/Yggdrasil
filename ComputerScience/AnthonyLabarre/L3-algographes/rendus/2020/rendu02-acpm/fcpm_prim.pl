
# Test d'une fonction fcpm_prim.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Prim -  Forêt couvrante de poids minimum
text==
Écrivez une fonction fcpm_prim(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Prim.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Les tests:

# Vérifications de fcpm_prim sur un graphe non connexe
testname0 = Vérifications de fcpm_prim sur un graphe non connexe (union du cours et du td)
pltest0==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation
>>> foret = fcpm_prim(G)
>>> sum(poids for *_, poids in foret.aretes())
41
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
==

# Vérifications de fcpm_prim sur un graphe non connexe
testname1 = Vérifications de fcpm_prim sur un graphe non connexe  (union du cours, du td et d'un graphe aléatoire)
pltest1==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = fcpm_prim(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
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













