extends = /model/math/set.pl

title = Produit cartésien

before ==
lenA, lenB = choice([[2,3],[3,2],[2,2]])
A = FiniteSet(*sample(range(10), lenA))
B = FiniteSet(*sample(range(10), lenB))
sol = FiniteSet(*ProductSet(A,B))
==

text == 
Ecrire en extension l'ensemble $! \\{ {{A|latex}} \\} \times \\{ {{B|latex}} \\}. !$
==