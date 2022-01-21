# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec un seul quantificateur, portant sur les éléments 
# d'un ensemble fini de nombres (parité, inégalité)
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
import numpy as np
res = 8*[0]
res2 = 9*[0]
for i in range(1):
    items, indsol = [], []
    A = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    B = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    if q == 1:
        items.append(r"\exists b \in B,\ \forall a \in A, a|b")
        valprop = any(all([b % a == 0 for a in A]) for b in B):
    elif q == 2:
        items.append(r"\exists b \in B,\ \forall a \in A, b|a")
        valprop = any(all([a % b == 0 for a in A]) for b in B):
        k = k + 1
        res[1] += 1
    if all(any([b % a == 0 for a in A]) for b in B):
        k = k + 1
        res[2] += 1
    if all(any([a % b == 0 for a in A]) for b in B):
        k = k + 1
        res[3] += 1
    if any(all([b % a == 0 for a in B]) for b in A):
        k = k + 1
        res[4] += 1
    if any(all([a % b == 0 for a in B]) for b in A):
        k = k + 1
        res[5] += 1
    if all(any([b % a == 0 for a in B]) for b in A):
        k = k + 1
        res[6] += 1
    if all(any([a % b == 0 for a in B]) for b in A):
        k = k + 1
        res[7] += 1
    res2[k]+=1

==

question ==
{{ A }} {{B }}
On considère l'ensemble 
{{ res }}
{{ res2 }}
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

