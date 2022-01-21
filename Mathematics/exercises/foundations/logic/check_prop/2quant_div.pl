# Déterminer si une proposition logique élémentaire est vraie.
# Proposition avec un seul quantificateur, portant sur les éléments 
# d'un ensemble fini de nombres (parité, inégalité)
# proposition logique, quantificateur

extends = /model/math/checkbox.pl

title = Déterminer si une proposition est vraie

before ==
import numpy as np
for i in range(1000):
    A = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    B = sample([2, 3, 4, 5, 6, 10, 12, 15, 20, 24, 30], randint(2, 4))
    gcdA = np.gcd.reduce(A)
    gcdB = np.gcd.reduce(B)
    lcmA = np.lcm.reduce(A)
    lcmB = np.lcm.reduce(B)
    
items, indsol = [], []

==

question ==
On considère l'ensemble 
$$ {{ A|latex }}. $$
Sélectionner les propositions qui sont vraies dans la liste ci-dessous.
==

