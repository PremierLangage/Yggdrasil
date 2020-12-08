# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


author=Wenjie Fang
title=Fusion d'une liste de listes

text==
On manipule les listes de listes, et on en a marre !

Ecrire une fonction ``fusion(lst)`` qui prend en paramètre une liste de listes, puis retourner une nouvelle liste qui est une concaténation successive de chaque élément de ``lst``. On voit alors que la valeur retournée sera une liste.

Par exemple, si on a

    lst = [[1, 2, 3], [4, 5], [], [6, 7, 8, 9]]

alors l'appel ``fusion(lst)`` doit retourner la liste

    [1, 2, 3, 4, 5, 6, 7, 8, 9]
==

tag=listoflist|extend

samplesol==
def fusion(l):
    res = []
    for e in l:
        res.extend(e)
    return res
==

before==
from random import randint

def fus(l):
    res = []
    for e in l:
        res.extend(e)
    return res

ll = [[randint(-10, 10) for _ in range(randint(-4,10))] for _ in range(randint(3, 10))]
res = fus(ll)
pltest2 = f">>> fusion({ll}) # Random\n{res}\n"

ll = [[randint(-10, 10) for _ in range(randint(-4,10))] for _ in range(randint(3, 10))]
res = fus(ll)
pltest3 = f">>> fusion({ll}) # Random\n{res}\n"

ll = [[randint(-10, 10) for _ in range(randint(-4,10))] for _ in range(randint(3, 10))]
res = fus(ll)
pltest4 = f">>> fusion({ll}) # Random\n{res}\n"

ll = [[randint(-10, 10) for _ in range(randint(-4,10))] for _ in range(randint(3, 10))]
res = fus(ll)
pltest5 = f">>> fusion({ll}) # Random\n{res}\n"

after = before
==

pltest0==
>>> fusion([])
[]
>>> fusion([[]])
[]
>>> fusion([[], [], []])
[]
>>> fusion([[1, 2, 3], [4, 5], [], [6, 7, 8, 9]])
[1, 2, 3, 4, 5, 6, 7, 8, 9]
==

pltest1==
>>> fusion([[1, 2, 3]])
[1, 2, 3]
>>> fusion([[], [], ['string', 'int', 'list'], ['dict', 'range']])
['string', 'int', 'list', 'dict', 'range']
>>> fusion([[[]], [[1, 2], [3, 4]], [[]]])
[[], [1, 2], [3, 4], []]
==

