# Author: D. Doyen
# Tags: trigonometric equation, sinus, cosinus
# Résoudre une équation trigonométrique
# 19/7/2021


extends = /model/math/interval.pl

param.rhs = "Rational(1, 2), -Rational(1, 2)"

param.interval = "(-pi,pi),"

param.interval_type = closed

before ==
from sympy import solveset, S
var('x')
lhs = choice([cos(x),sin(x)])
rhs =choice(eval(param['rhs']))
a,b=choice(eval(param['interval']))
interv=Interval(a,b)
ineq = choice([lhs >= rhs, lhs <= rhs])
sol = solveset(ineq, x, domain=S.Reals).intersect(interv)
==

wobracket = True

question ==
Déterminer la ou les solutions de l'équation $$ {{ ineq|latex }} $$
sur l'intervalle $! {{ interv|latex }} !$. Quand il y a plusieurs solutions, les séparer par des virgules.
==