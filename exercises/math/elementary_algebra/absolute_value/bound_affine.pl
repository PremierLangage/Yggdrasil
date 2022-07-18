# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/chainineq.pl

before ==
from sympy import imageset
from sympy2latex import latex_chainineq
var('x')

def image_abs(interv):
    a, b = interv.start, interv.end
    l, r = interv.left_open, interv.right_open
    if a >=0:
        return Interval(a, b, left_open=l, right_open=r)
    if b <= 0:
        return Interval(Abs(b), Abs(a), left_open=r, right_open=l)
    if Abs(a) < Abs(b):
        return Interval(0, Abs(b), left_open=False, right_open=r)
    else:
        return Interval(0, Abs(b), left_open=False, right_open=l)

a = randint(-3, 3, [0, 1])
b = randint(-8, 8, [0])
x1, x2 = sorted(sampleint(-5, 5, 2))
interv = choice([Interval.Lopen(x1, x2), Interval.Ropen(x1, x2)])
expr = a*x+b

sol = imageset(x, Abs(expr), interv) 
sol_chainineq = latex_chainineq(expr, sol) 
ineq = latex_chainineq(x, interv) 
==


question ==
Soit un nombre $% x %$ tel que $% {{ineq}} %$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==