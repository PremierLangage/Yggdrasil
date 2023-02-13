# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

title=Histogramme

text==
Etant donnée une liste ``lst``, son histogramme est une liste ``histo`` de couples de la forme ``(x, n)``, avec ``x`` un élément de ``lst``
et ``n`` le nombre d'occurrences de ``x`` dans ``lst``. De plus, on demande que les couples ``(x, n)`` dans ``histo`` soient ordonnés par
la première occurrence de ``x`` dans la liste originale ``lst``.

Par exemple, l'histogramme de la liste ``['None', 'None', False, 42, 'None', False]`` est ``[('None', 3), (False, 2), (42, 1)]``.

Écrire une fonction ``histogramme(lst)`` qui retourne l'histogramme de la liste ``lst`` passée en paramètre. Vous pouvez utiliser la méthode ``index``.

La fonction **ne doit pas modifier son paramètre**.
==

taboo=dict

tag=elementAccess|in|append|tuple

samplesol==
def histogramme(l):
    elems = []
    occu = []
    for e in l:
        if e not in elems:
            elems.append(e)
            occu.append(1)
        else:
            occu[elems.index(e)] += 1
    return [(elems[i], occu[i]) for i in range(len(elems))]
==

before==
def histo(l):
    elems = []
    occu = []
    for e in l:
        if e not in elems:
            elems.append(e)
            occu.append(1)
        else:
            occu[elems.index(e)] += 1
    return [(elems[i], occu[i]) for i in range(len(elems))]

import random

lrand = [random.randint(-10, 10) for i in range(100)]
pltest2 = f">>> histogramme({lrand})\n{histo(lrand)}"

lrand = [random.randint(-10, 10) for i in range(100)]
pltest3 = f">>> histogramme({lrand})\n{histo(lrand)}"

lrand = [random.randint(-10, 10) for i in range(100)]
pltest4 = f">>> histogramme({lrand})\n{histo(lrand)}"

lrand = [random.randint(-10, 10) for i in range(100)]
pltest5 = f">>> histogramme({lrand})\n{histo(lrand)}"

after = before
==

pltest0==
>>> histogramme([])
[]
>>> histogramme([1, 1, 1, 1, 1])
[(1, 5)]
>>> histogramme(['None', None, False, 42, None, False])
[('None', 1), (None, 2), (False, 2), (42, 1)]
>>> histogramme([1, 2, 3, 4, 5])
[(1, 1), (2, 1), (3, 1), (4, 1), (5, 1)]
==

pltest1==
>>> l = [1, 1, 2, 3, 3, 2, 1] #
>>> histogramme(l)
[(1, 3), (2, 2), (3, 2)]
>>> l
[1, 1, 2, 3, 3, 2, 1]
==




