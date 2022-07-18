# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/chainineq.pl

before ==
from sympy import imageset
from sympy2latex import latex_chainineq
var('x')
a = randint(-3, 3, [0])
b = randint(-8, 8, [0])
x1, x2 = sorted(sampleint(-5, 5, 2))
interv = choice([Interval.Lopen(x1, x2), Interval.Ropen(x1, x2)])
expr = a*x+b

sol = imageset(x, a*x+b, interv) 
sol_chainineq = latex_chainineq(expr, sol) 
ineq = latex_chainineq(x, interv) 
==


question ==
Soit un nombre $% x %$ tel que $% {{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==