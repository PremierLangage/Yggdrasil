extends = /model/math/set.pl

before ==
from sympy import Intersection
A = FiniteSet(*sample(range(10), randint(3, 5)))
B = FiniteSet(*sample(range(10), randint(3, 5)))
sol = Intersection(A, B)
==

question ==
On considère les ensembles $! A= {{ A|latex }} !$ et $! B={{B|latex}} !$. 
Déterminer $! A \cap B !$.
==

keypad = ["emptyset"]
