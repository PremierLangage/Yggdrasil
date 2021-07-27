# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/chainineq.pl

before ==
from sympy import imageset
var('x')
a = randint(-3, 3, [0])
b = randint(-8, 8, [0])
interv = Interval(x1, x2)
interv.left_open = choice([True, False])
interv.right_open = choice([True, False])

sol = imageset(x, a*x+b, interv) 

ineq = latex_chainineq(x, interv) 
expr = a*x+b
==


question ==
Soit un nombre $% x %$ tel que $% {{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==