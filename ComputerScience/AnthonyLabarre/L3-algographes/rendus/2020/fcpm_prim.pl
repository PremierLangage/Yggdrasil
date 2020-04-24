
# Test d'une fonction fcpm_prim.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Prim -  Arbres (et forêts) couvrants de poids minimum
text==
Écrivez: 
<ul>
<li>une classe Graphe implémentant un graphe pondéré non orienté
<li>une classe Tas implémentant une file à priorité
<li>une classe UnionFind
<li>acpm_prim(graphe, sommet), qui prend en paramètres un graphe et un sommet de départ et renvoie un ACPM pour la composante connexe du sommet donné en suivant l'algorithme de Prim;
<li>acpm_kruskal(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Kruskal;
<li>fcpm_prim(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Prim.
</ul>
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Les tests:

# Vérifications de fcpm_prim sur un graphe non connexe
testname6 = Vérifications de fcpm_prim sur un graphe non connexe (union du cours et du td)
pltest6==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation
>>> foret = fcpm_prim(G)
>>> sum(poids for *_, poids in foret.aretes())
41
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante) #
==

# Vérifications de fcpm_prim sur un graphe non connexe
testname3 = Vérifications de fcpm_prim sur un graphe non connexe  (union du cours, du td et d'un graphe aléatoire)
pltest3==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = fcpm_prim(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
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












