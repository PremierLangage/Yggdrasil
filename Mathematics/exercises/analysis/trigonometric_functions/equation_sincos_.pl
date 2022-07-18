# Author: D. Doyen
# Tags: trigonometric equation, sinus, cosinus
# Résoudre une équation trigonométrique
# 19/7/2021


extends = /model/math/set.pl

param.rhs = [0,-1,1]

param.interval = [(-2*pi,2*pi),(0,2*pi),(-pi,pi)]

param.interval_type = closed

before ==
from sympy import solveset, S
var('x')
lhs = choice([cos(x),sin(x)])
rhs =choice(eval(param['rhs']))
a,b=choice(eval(param['interval']))
interv=Interval(a,b)
sol=FiniteSet(*list(solveset(lhs-rhs,x,domain=S.Reals).intersect(interv)))
==

wobracket = True

question ==
Déterminer la ou les solutions de l'équation $$ {{ lhs|latex }} = {{ rhs|latex }} $$
sur l'intervalle $! {{ interv|latex }} !$. Quand il y a plusieurs solutions, les séparer par des virgules.
==