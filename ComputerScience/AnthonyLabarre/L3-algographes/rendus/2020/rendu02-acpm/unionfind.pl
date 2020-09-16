# Test d'une classe UnionFind implémentant la gestion d'ensembles disjoints.
@ /utils/sandboxio.py
@ unionfind.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = UnionFind
text==
Écrivez une classe UnionFind implémentant la gestion d'ensembles disjoints.
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==


# Les tests:

# Vérifications basiques de la classe UnionFind
testname0 = Vérifications basiques de la classe UnionFind
pltest0==
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
# Complétez le code ci-dessous, et cliquez sur le bouton de validation quand vous avez terminé
class UnionFind(object):
    """Implémentation de la structure de données Union-Find."""
    def __init__(self, ensemble):
        """Initialisation des structures de données nécessaires."""
        pass  # à compléter

    def find(self, element):
        """Renvoie le numéro de la classe à laquelle appartient l'élément."""
        pass  # à compléter

    def union(self, premier, second):
        """Fusionne les classes contenant les deux éléments donnés."""
        pass  # à compléter

==








