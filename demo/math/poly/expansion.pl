extends = /model/math/poly.pl

before ==
x = Symbol('x')
P = randint(-3, 3, [0])*x + randint(-3, 3, [0])
Q = randint(-3, 3, [0])*x + randint(-3, 3, [0])
expr = P * Q
sol = expr.expand()
==

question ==
Développer l'expression suivante :
$$ {{ expr|latex }}. $$
==

poly_form = "expanded"