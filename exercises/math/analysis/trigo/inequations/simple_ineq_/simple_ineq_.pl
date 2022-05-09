# Author: D. Doyen
# Tags: trigonometric inequation, sinus, cosinus
# Résoudre une inéquation trigonométrique
# 19/7/2021

extends = /model/math/interval.pl

title = Résolution d'une inéquation trigonométrique

param.rhs = "Rational(1,2),-Rational(1,2),sqrt(2)/2,-sqrt(2)/2,sqrt(3)/2,-sqrt(3)/2"

param.interval = "(-pi,pi),"

param.interval_type = closed

before ==
from sympy import solveset, S, imageset, Union
var('x')
lhs = choice([cos(x),sin(x)])
rhs =choice(eval(param['rhs']))
a,b=choice(eval(param['interval']))
interv=Interval(a,b)
ineq = choice([lhs >= rhs, lhs <= rhs])
sol0 = solveset(ineq, x, domain=S.Reals)
sol = Union(sol0, imageset(Lambda(x, x-2*pi), sol0)).intersect(interv)
==

wobracket = True

question ==
Résoudre l'inéquation $$ {{ ineq|latex }} $$
sur l'intervalle $! {{ interv|latex }} !$.
==