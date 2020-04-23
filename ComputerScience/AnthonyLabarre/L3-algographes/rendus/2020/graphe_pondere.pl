# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Arbres (et forêts) couvrants de poids minimum
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

# Mon code
before==
import corrlib_graphes
==

# Les tests:

# Vérifications basiques de la classe Graphe
#testname0 = Vérifications basiques de la classe Graphe
pltest0== 
>>> G = Graphe()# Existance d'une class Graphe
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])
>>> sorted(G.sommets()) 
[0, 1, 2, 3]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes())
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes())
[-2, -1, 2, 3, 4]
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







