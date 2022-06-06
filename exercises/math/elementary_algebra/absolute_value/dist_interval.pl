extends = /model/math/interval.pl

title = Intervalle et distance

before ==
from sympy import solveset, S
var('x')
b = randint(1, 6)
rhs = randint(1, 5)
lhs = Abs(x - b)

ineq = choice([lhs <= rhs, lhs < rhs])
sol = solveset(ineq, x, domain=S.Reals)
==

question ==
Ecrire sous la forme d'un intervalle l'ensemble des réels $! x !$ tels que $$ {{ ineq|latex }}. $$
==
