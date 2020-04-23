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


# Vérifications basiques de la classe UnionFind
testname3 = Vérifications basiques de la classe UnionFind
pltest3==
>>> # initialisation d'un ensemble de singletons
>>> import itertools, random, unionfind; n = 50; ma_structure = unionfind.UnionFind(range(n)); sa_structure = UnionFind(range(n))
>>> # fusions aléatoires
>>> nbr_unions = 20
>>> couples = list(itertools.combinations(range(n), 2)); random.shuffle(couples)
>>> for i in range(nbr_unions):
...     a, b = couples.pop()
...     sa_structure.union(a, b)
...     ma_structure.union(a, b)
>>> sa_partition = sorted(map(sorted, unionfind.unionfind_vers_collection(sa_structure, range(n))))
>>> ma_partition = sorted(map(sorted, unionfind.unionfind_vers_collection(ma_structure, range(n))))
>>> if ma_partition != sa_partition:
...     print("résultat attendu:", ma_partition)
...     print("résultat obtenu:", sa_partition)
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







