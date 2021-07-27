# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/chainineq.pl

before ==
from sympy import imageset
var('x')
a = randint(-3,3,[0])
b = randint(-8,8,[0])


sol = imageset(x, a*x+b, Interval(x1, x2)) 

ineq = " ".join(latex([x1, s1, x, s2, x2]))
expr = a*x+b
==


question ==
Soit un nombre $% x %$ tel que $% {{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==