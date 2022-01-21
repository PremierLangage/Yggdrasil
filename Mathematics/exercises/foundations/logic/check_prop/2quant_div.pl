# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec un seul quantificateur, portant sur les éléments 
# d'un ensemble fini de nombres (parité, inégalité)
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
import numpy as np
res = 4*[0]
for i in range(1000):
    A = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    B = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    gcdA = np.gcd.reduce(A)
    gcdB = np.gcd.reduce(B)
    lcmA = np.lcm.reduce(A)
    lcmB = np.lcm.reduce(B)
    if any(all([a for a in A if b % a == 0]) for b in B):
        res[0] += 1
    if any(all([a for a in A if a % b == 0]) for b in B):
        res[1] += 1
    if all(any([a for a in A if b % a == 0]) for b in B):
        res[2] += 1
    if all(any([a for a in A if a % b == 0]) for b in B):
        res[3] += 1
items, indsol = [], []

==

question ==
On considère l'ensemble 
{{ res }}
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

