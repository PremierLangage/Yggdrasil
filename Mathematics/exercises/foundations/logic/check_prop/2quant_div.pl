# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec un seul quantificateur, portant sur les éléments 
# d'un ensemble fini de nombres (parité, inégalité)
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

test ==
from random import sample, randint
val1 = [x for x in range(2, 100) if x%2==0 or x%3==0]
val2 = [6, 8, 12, 16, 18, 20, 24, 28, 30]

lst = sample(val2, k=randint(3, 4))

mulany = [x for x in val1 if any([x%y==0 for y in lst])]

mulall = [x for x in val1 if all([x%y==0 for y in lst])]

divany = [x for x in val1 if any([y%x==0 for y in lst])]

divall = [x for x in val1 if all([y%x==0 for y in lst])]
==

before ==
items, indsol = [], []
A = sample([6, 10, 12, 15, 20, 24, 30], randint(2, 4))
B = sample([2, 3, 4, 5, 6, 10, 12, 15], randint(2, 4))
k = 0
for q in range(4):
    if q == 0:
        items.append(r"$! \exists b \in B,\ \forall a \in A, a|b !$")
        valprop = any(all([b % a == 0 for a in A]) for b in B)
    elif q == 1:
        items.append(r"$! \exists b \in B,\ \forall a \in A, b|a !$")
        valprop = any(all([a % b == 0 for a in A]) for b in B)
    elif q == 2:
        items.append(r"$! \forall b \in B,\ \exists a \in A, a|b !$")
        valprop = all(any([b % a == 0 for a in A]) for b in B)
    elif q == 3:
        items.append(r"$! \forall b \in B,\ \exists a \in A, b|a !$")
        valprop = all(any([a % b == 0 for a in A]) for b in B)
    if valprop:
        indsol.append(k)
    k += 1

==

question ==
{{ A }} {{B }}
On considère l'ensemble 

Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

