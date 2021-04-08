extends = /model/math/set.pl

title = Intersection d'ensembles

before ==
from sympy import Intersection
A = FiniteSet(*sample(range(10), randint(4, 7)))
B = FiniteSet(*sample(range(10), randint(4, 7)))
sol = Intersection(A, B)
==

text ==
On considère les ensembles suivants :
$$ A=\\{ {{A|latex}} \\},\ B=\\{ {{B|latex}} \\}.$$

Déterminer $! A \cap B !$.
==