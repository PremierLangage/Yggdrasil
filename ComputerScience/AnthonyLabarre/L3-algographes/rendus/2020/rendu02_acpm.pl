# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
# @ corrlib_graphes.py # TODO: networkx pas installé sur la plateforme
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
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


# Mon code
before==
==

# Les tests:

# Vérifications basiques de la classe Graphe
pltest0==
>>> G = Graphe()
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])
>>> sorted(G.sommets())
[0, 1, 2, 3]
>>> sorted(G.aretes())
[(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes())
[-2, -1, 2, 3, 4]
==

# Vérification de la classe Tas sur des entiers
pltest1==
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [randint(-100, 100) for _ in range(10)]; T = Tas()
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction != elem:
...         print("attendu:", elem, ", obtenu:", extraction)
==

# Vérification de la classe Tas sur des triplets (premier élément = critère pour le minimum)
pltest2==
>>> # création d'une liste de triplets aléatoires
>>> from random import randint; donnees = [(randint(-100, 100), randint(-100, 100), randint(-100, 100)) for _ in range(10)]; T = Tas()
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction[0] != elem[0]:
...         print("attendu: un triplet avec première valeur =", elem[0], ", obtenu: un triplet avec première valeur =", extraction[0])
==

# Vérifications basiques de la classe UnionFind
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

# Vérifications de acpm_prim sur un graphe connexe
pltest4==
>>> import random; G = Graphe(); G.ajouter_aretes([(0, 1, 5), (0, 3, 4), (0, 4, 2), (1, 4, 2), (2, 3, 9), (2, 5, 5), (3, 4, 3), (3, 5, 7), (3, 6, 4), (4, 6, 7), (5, 6, 12)]); arbre = acpm_prim(G, random.choice(list(G.sommets()))
>>> sum(poids for *_, poids in arbre.aretes())
23
>>> G = Graphe(); G.ajouter_aretes([(17, 18, 4), (17, 20, 3), (17, 21, 1), (17, 22, 8), (18, 19, 7), (18, 20, 2), (18, 21, 3), (19, 21, 8), (19, 22, 5), (19, 23, 4), (20, 21, 6), (21, 22, 9), (21, 23, 6), (22, 23, 2)]); arbre = acpm_prim(G, random.choice(list(G.sommets()))
>>> sum(poids for *_, poids in arbre.aretes())
18
==

# Vérifications de acpm_kruskal sur un graphe connexe
pltest5==
>>> import random; G = Graphe(); G.ajouter_aretes([(0, 1, 5), (0, 3, 4), (0, 4, 2), (1, 4, 2), (2, 3, 9), (2, 5, 5), (3, 4, 3), (3, 5, 7), (3, 6, 4), (4, 6, 7), (5, 6, 12)]); arbre = acpm_kruskal(G, random.choice(list(G.sommets()))
>>> sum(poids for *_, poids in arbre.aretes())
23
>>> G = Graphe(); G.ajouter_aretes([(17, 18, 4), (17, 20, 3), (17, 21, 1), (17, 22, 8), (18, 19, 7), (18, 20, 2), (18, 21, 3), (19, 21, 8), (19, 22, 5), (19, 23, 4), (20, 21, 6), (21, 22, 9), (21, 23, 6), (22, 23, 2)]); arbre = acpm_kruskal(G, random.choice(list(G.sommets()))
>>> sum(poids for *_, poids in arbre.aretes())
18
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


