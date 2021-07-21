extends = /model/math/poly.pl

title = Savoir simplifier des expressions (développement, factorisation, identités remarquables, fractions…)
before ==
x = Symbol('x')
P = randint(-3,3,[0])*x**2 + randint(-3, 3, [0])*x + randint(-3, 3, [0])
Q = randint(-3, 3, [0])*x + randint(-3, 3, [0])
expr = P * Q
sol = expr.expand()
==

question ==
Développer l'expression suivante :
$$ {{ expr|latex }}. $$
==

poly_form = "expanded"