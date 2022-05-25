extends = /model/math/set.pl

title = Equation avec valeur abolue

wobracket = True

before ==
from sympy import solveset, Eq, S
var('x')
a = randint(-6, 6, [0,1,-1])
b = randint(-6, 6, [0,1,-1])
rhs = randint(1, 5)
lhs = Abs(a*x + b)
sol = solveset(Eq(lhs, rhs), x, domain=S.Reals)
==

question ==
Déterminer la ou les solutions de l'équation $$ {{ lhs|latex }} = {{ rhs|latex }}. $$
Séparer les différentes solutions par une virgule.
==