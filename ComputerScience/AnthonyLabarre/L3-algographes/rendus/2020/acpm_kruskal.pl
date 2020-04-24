
# Test d'une fonction acpm_kruskal.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Kruskal: Arbres (et forêts) couvrants de poids minimum.
text==
Écrivez une fonction acpm_kruskal(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Kruskal.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Mon code
before==
import corrlib_graphes
==

# Les tests:


# Vérifications de acpm_kruskal sur un graphe connexe
testname0 = Vérifications de acpm_kruskal sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation de l'instance du cours
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
23
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname1 = Vérifications de acpm_kruskal sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation de l'exemple du TD
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
18
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname2 = Vérifications de acpm_kruskal sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))) # initialisation d'une instance aléatoire
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> arbre = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in arbre.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==


# Vérifications de acpm_kruskal sur un graphe non connexe
testname3 = Vérifications de acpm_kruskal sur un graphe non connexe
pltest3==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante) #
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













