extends = /model/math/interval.pl

title = Inéquation avec valeur absolue

lang = fr

before ==
from sympy import solveset, S
var('x')
a = randint(-6, 6, [0,1,-1])
b = randint(-6, 6, [0,1,-1])
rhs = randint(1, 5)
lhs = Abs(a*x + b)

ineq = choice([lhs >= rhs, lhs > rhs, lhs <= rhs, lhs < rhs])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Déterminer l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==