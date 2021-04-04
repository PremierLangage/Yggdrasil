extends = /model/mathquill.pl

before ==
P = randint_poly(1, 2, 2)
Q = randint_poly(1, 2, 2)
expr = P * Q
sol = expr.expand()
==

text ==
Développer l'expression suivante :

$$ {{ expr|latex }}. $$
==

poly_form = expanded