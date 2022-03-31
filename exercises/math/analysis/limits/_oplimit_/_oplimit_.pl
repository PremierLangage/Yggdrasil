extends = /model/math/multinput.pl
title = Calcul de limites

param.form = [0, 1, 2]

before ==
from sympy import atan, Limit
n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []

var('x')
inf = [ln(x), exp(x), x]
f = [atan(x), x/(x+1)]
b = [sin(x), cos(x)]


def rand_expr(i):
    inf1, inf2 = sample(inf, 2)
    f1, f2 = sample(f, 2)
    b1, b2 = sample(b, 2)
    if i == 0:
        return inf1 - inf2
    elif i == 1:
        return inf1 + f1
    elif i == 2:
        return inf1 + b1

latexlim=[]
sol=[]


for i in [0, 1, 2]:
    lim=Limit(rand_expr(i), x, oo)
    latexlim.append(latex(lim))
    sol.append(lim.doit())
==

question ==
Calculer les limites suivantes.
==

