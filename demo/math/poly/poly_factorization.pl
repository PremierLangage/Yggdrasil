extends = /model/math/poly.pl

before ==
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
sol = P * Q
expr = sol.expand()
==

text ==
Développer l'expression suivante :

$$ {{ expr|latex }}. $$
==

poly_form = factorized
