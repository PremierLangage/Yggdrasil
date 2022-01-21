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
for i in range(1000):
    A = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    B = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    k = 0
    if any(all([b % a == 0 for a in A]) for b in B):
        k = k + 1
        res[0] += 1
    if any(all([a % b == 0 for a in A]) for b in B):
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
        res[0] += 1
    if any(all([a % b == 0 for a in B]) for b in A):
        k = k + 1
        res[1] += 1
    if all(any([b % a == 0 for a in B]) for b in A):
        k = k + 1
        res[2] += 1
    if all(any([a % b == 0 for a in B]) for b in A):
        k = k + 1
        res[3] += 1
    res2[k]+=1
items, indsol = [], []

==

question ==
{{ A }} {{B }}
On considère l'ensemble 
{{ res }}
{{ res2 }}
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

