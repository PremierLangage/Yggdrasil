# Author: D. Doyen
# Tags: inequalities
# Encadrer ax+b
# 19/8/2020

extends = /model/math/multimathinput.pl

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

n = 3
inputs = [MathInput(type="chainineq") for _ in range(n)]
prefixes = []
assumps = []
for i in range(n):
    while True:
        a = randint(-6, 6, [0])
        b = randint(-6, 6, [0])
        c = randint(-6, 6, [0])
        d = randint(-6, 6, [0])
        x1 = -Rational(b, a)
        x2 = -Rational(c, d)
        if x1 != x2:
            break
    expr1 = a*x + b
    expr2 = c*x + d
    xmin = min([x1, x2])
    xmax = max([x1, x2])
    case = randint(0, 2)
    if case == 0:
        ineq = x <= xmin
        domain = Interval(-oo, xmin)
        assumps.append(rf"$! {latex(ineq)} !$")
    elif case == 1:
        ineq = x >= xmax
        domain = Interval(xmax, oo)
        assumps.append(rf"$! {latex(ineq)} !$")
    else:
        domain = Interval(xmin, xmax)
        assumps.append(rf"$! x \in {latex(domain)} !$")
    if i == 0:
        inputs[i].sol = refine_absval(Abs(expr1) + Abs(expr2), x, domain)
        prefixes.append(rf"$! |{latex(expr1)}| + |{latex(expr2)}| = !$")
    else:
        inputs[i].sol = refine_absval(Abs(expr1) - Abs(expr2), x, domain)
        prefixes.append(rf"$! |{latex(expr1)}| - |{latex(expr2)}| = !$")

a = randint(-3, 3, [0, 1])
b = randint(-8, 8, [0])
x1, x2 = sorted(sampleint(-5, 5, 2))
interv = choice([Interval.Lopen(x1, x2), Interval.Ropen(x1, x2)])
expr = x

sol = image_abs(interv) 
sol_chainineq = latex_chainineq(Abs(x), sol) 
ineq = latex_chainineq(x, interv) 
==

question ==
Soit un nombre $% x %$ tel que $! {{ineq}} !$. Déterminer l'encadrement le plus précis possible de $% {{expr|latex}} %$.
==