extends = /model/math/poly.pl

before ==
x = Symbol('x')
z1 = randint(-3, 3, [0])*x + randint(-3, 3, [0])
z2 = randint(-3, 3, [0])*x + randint(-3, 3, [0])
expr = P * Q
sol = expr.expand()
==

question ==
Développer l'expression suivante :

$$ {{ expr|latex }}. $$
==

poly_form = expanded