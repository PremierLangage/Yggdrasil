extends = /model/math/poly.pl

title = Savoir résoudre une équation du second degré

before ==
x = Symbol('x')
P = x + randint(-2, 2)
Q = x + randint(-2, 2)
sol = P * Q
expr = sol.expand()
==

question ==
Factoriser l'expression suivante :
$$ {{ expr|latex }}. $$
==

poly_form = "factorized"
