extends = /model/math/set.pl

title = Ecrire en extension le produit cartésien de deux ensembles

before ==
from sympy import ProductSet
lenA, lenB = choice([[2,3],[3,2],[2,2]])
A = FiniteSet(*sample(range(10), lenA))
B = FiniteSet(*sample(range(10), lenB))
sol = FiniteSet(*ProductSet(A, B))
==

question == 
Ecrire en extension l'ensemble $! {{A|latex}} \times {{B|latex}}. !$
==