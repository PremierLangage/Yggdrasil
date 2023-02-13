# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title=Intégrer deux listes

text==
Supposons qu'on a deux listes ``l1`` et ``l2``, **qui ne sont pas forcément de la même longueur**, on veut les intégrer dans une seule liste ``lst`` de couples
de la façon suivante : le i-ième élément de ``lst`` doit être le couple formé par le i-ième élément de ``l1`` et de ``l2``. 

Si une des listes n'a pas assez d'éléments, alors **on doit utiliser ``None`` pour représenter les éléments manquants**.

Par exemple, si ``l1 = ['nein', False, 0]`` et ``l2 = [1, 'ja', True, 'oui']``,
alors la liste intégrée ``lst`` doit être ``[('nein', 1), (False, 'ja'), (0, True), (None, 'oui')]``.

Écrire une fonction ``ziplist(l1, l2)`` qui intègre ``l1`` et ``l2`` et renvoie la liste de couples obtenue. 

**La fonction ne doit pas changer les deux listes en paramètre.**
==

tag=len|elementAccess|tuple|append

samplesol==
def ziplist(l1, l2):
    n = max(len(l1), len(l2))
    res = []
    for i in range(n):
        e1 = l1[i] if i < len(l1) else None
        e2 = l2[i] if i < len(l2) else None
        res.append((e1, e2))
    return res

# Alternative
def ziplist2(l1, l2):
    n = max(len(l1), len(l2))
    ll1 = l1 + [None] * (n - len(l1))
    ll2 = l2 + [None] * (n - len(l2))
    return [(ll1[i], ll2[i]) for i in range(n)]
==

pltest0==
>>> ziplist([], [])
[]
>>> ziplist([1, 2, 3], [])
[(1, None), (2, None), (3, None)]
>>> ziplist([], ['nous', 'vous', 'tous'])
[(None, 'nous'), (None, 'vous'), (None, 'tous')]
>>> ziplist(['nein', False, 0], [1, 'ja', True, 'oui'])
[('nein', 1), (False, 'ja'), (0, True), (None, 'oui')]
>>> ziplist([1, 2, 3], ['a', 'b', 'c'])
[(1, 'a'), (2, 'b'), (3, 'c')]
==

pltest1==
>>> l1 = [1, 2, 3] #
>>> l2 = [4, 5, 6, 7]
>>> ziplist(l1, l2)
[(1, 4), (2, 5), (3, 6), (None, 7)]
>>> l1
[1, 2, 3]
>>> l2
[4, 5, 6, 7]
==




