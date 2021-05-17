extends = /model/math/expr.pl

title = Inéquation avec valeur absolue

before ==
from sympy import
a = randint(-6, 6, [0])
d = randint(1, 5)
var('x')
expr = Abs(x-a)
ineq = choice([expr <= d, expr < d])
sol = solveset(ineq, x, domain=S.Reals)
==

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq|latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

