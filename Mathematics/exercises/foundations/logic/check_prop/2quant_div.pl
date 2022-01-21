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
    if q == 0:
        items.append(r"\exists b \in B,\ \forall a \in A, a|b")
        valprop = any(all([b % a == 0 for a in A]) for b in B):
    elif q == 1:
        items.append(r"\exists b \in B,\ \forall a \in A, b|a")
        valprop = any(all([a % b == 0 for a in A]) for b in B):
    elif q == 2:
        items.append(r"\forall b \in B,\ \exists a \in A, a|b")
        valprop = all(any([b % a == 0 for a in A]) for b in B):
    elif q == 3:
        items.append(r"\forall b \in B,\ \exists a \in A, b|a")
        valprop = all(any([a % b == 0 for a in A]) for b in B):


==

question ==
{{ A }} {{B }}
On considère l'ensemble 
{{ res }}
{{ res2 }}
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

