extends = /model/math/poly.pl

title = Factoriser un polynôme

before ==
from randsympy import randint_poly
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
sol = P * Q
expr = sol.expand()
==

question ==
Factoriser l'expression suivante :
$$ {{ expr|latex }}. $$
==

poly_form = "factorized"
