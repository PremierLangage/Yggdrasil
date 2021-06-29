extends = /model/math/poly.pl

before ==
from randsympy import randint_poly
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
expr = P * Q
sol = expr.expand()
==

question ==
Développer l'expression suivante :

$$ {{ expr|latex }}. $$
==

poly_form = expanded