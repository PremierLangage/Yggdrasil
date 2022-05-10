extends = /model/math/multimathinput.pl
title = Calcul de limites

param.form = [0, 1, 2]



before == #|py|
from sympy import atan, Limit
n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []

var('x')
inf = [ln(x), exp(x), x]
f = [atan(x), x/(x+1)]
b = [sin(x), cos(x)]
f0 = [1/ln(x), 1/exp(x), 1/x]


def rand_expr(i):
    f = sample(terms, 2)
    return f[0] + f[1]

cases = [0, 1, 3]
shuffle(cases)

for i in range(n):
    lim = Limit(rand_expr(cases[i]), x, oo)
    s = latex(lim)
    prefixes.append(f"$! \displaystyle {s} = !$")
    inputs[i].sol = lim.doit()
    inputs[i].type = "expr"
    inputs[i].evalparam = {}
==

question ==
Calculer les limites suivantes.
==

latexsettings.ln_notation = True
