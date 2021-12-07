# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

author=Wenjie Fang
title=Découper une liste

text==
On veut découper une liste en des petits segments de la même longueur autant que possible. Supposons qu'on a la liste suivante :

    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

et on veut le découper en sous listes de longueur ``4``. S'il y a des éléments en trop,
alors on les met dans une derniére liste séparée. Avec ce découpage, on obtient alors la liste de listes suivante :

    [[2, 3, 5, 7], [11, 13, 17, 19], [23, 29]]

Ecrire une fonction ``decoupe(lst, len)`` qui retourne la liste de segments obtenue en découpant la list ``lst`` en des segments de longueur ``len``
et en mettant les éléments en trop dans un dernier segment séparé. Si ``seglen <= 0``, alors la fonction doit retourner une liste vide.
Si ``lst`` est vide, comme il n'y a pas de segment possible, la fonction doit aussi retourner une liste vide.
==

tag=listoflist|ForIn|algo

samplesol==
def decoupe(l, sl):
    if sl <= 0:
        return []
    res, seg, cnt = [], [], 0
    for e in l:
        seg.append(e)
        cnt += 1
        if cnt == sl:
            cnt = 0
            res.append(list(seg))
            seg = []
    if seg:
        res.append(list(seg))
    return res
==

before=
XXX==
from random import randint

def produce(n, sl):
    res = []
    for i in range(n // sl):
        res.append([i * sl + j for j in range(sl)])
    leftover = list(range((n // sl) * sl, n))
    if leftover:
        res.append(leftover)
    return res

n = randint(4, 20)
sl = randint(1, 8)
src = list(range(n))
res = produce(n, sl)
pltest2 = f">>> decoupe({src}, {sl})\n{res}\n"

n = randint(4, 20)
sl = randint(1, 8)
src = list(range(n))
res = produce(n, sl)
pltest3 = f">>> decoupe({src}, {sl})\n{res}\n"

n = randint(4, 20)
sl = randint(1, 8)
src = list(range(n))
res = produce(n, sl)
pltest4 = f">>> decoupe({src}, {sl})\n{res}\n"

n = randint(4, 20)
sl = randint(1, 8)
src = list(range(n))
res = produce(n, sl)
pltest5 = f">>> decoupe({src}, {sl})\n{res}\n"

n = randint(4, 20)
sl = randint(1, 8)
src = list(range(n))
res = produce(n, sl)
pltest6 = f">>> decoupe({src}, {sl})\n{res}\n"

after = before
==

pltest0==
>>> decoupe([1, 2, 3], 1) # Simple 1
[[1], [2], [3]]
>>> decoupe([1, 2, 3], 2) # Simple 2
[[1, 2], [3]]
>>> decoupe([1, 2, 3, 4], 2) # Simple 3
[[1, 2], [3, 4]]
>>> decoupe([1, 2, 3], 3) # Simple 4
[[1, 2, 3]]
==

pltest1==
>>> decoupe([1, 2, 3], 100000000000) # Bizarre 1
[[1, 2, 3]]
>>> decoupe([1, 2, 3], -10) # Bizarre 2
[]
>>> decoupe([1, 2, 3], 0) # Bizarre 3
[]
>>> decoupe([], 3) # Bizarre 4
[]
==




drcode==
def decoupe(l,n):
    lll=[]
    while l:
        ll=[]
        nb=n
        while l and nb>0:
            ll.append(l.pop(0))
            nb -= 1
        lll.append(ll)
    return lll
    
==