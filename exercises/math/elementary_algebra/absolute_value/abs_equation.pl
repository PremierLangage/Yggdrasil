extends = /model/math/set.pl

title = Equation avec valeur abolue

wobracket = True

before ==
from sympy import solveset, Eq, S
a = randint(-6, 6, [0,1,-1])
b = randint(-6, 6, [0,1,-1])
d = randint(1, 5)
var('x')
lhs = Abs(a*x+b)
sol = list(solveset(Eq(lhs,d),x,domain=S.Reals))
==

question ==
Déterminer la ou les solutions de l'équation $$ {{lhs|latex}} = {{d}}. $$
Séparer les différentes solutions par une virgule.
==