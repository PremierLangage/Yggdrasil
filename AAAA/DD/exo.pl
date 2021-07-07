extends = /model/math/set.pl

before ==
from sympy import Intersection
A = FiniteSet(*sampleint(1, 9, randint(3, 5)))
B = FiniteSet(*sampleint(1, 9, randint(3, 5)))
sol = Intersection(A, B)
==

question ==
On considère les ensembles $! A= {{ A|latex }} !$ et $! B={{ B|latex }} !$. 
Déterminer l'ensemble suivant.
==

prefix ==
$! A \cap B =!$
==

keypad = ["emptyset"]