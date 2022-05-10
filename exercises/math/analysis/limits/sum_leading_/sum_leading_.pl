extends = /model/math/multimathinput.pl
title = Calcul de limites

param.terms = "ln(x), exp(x), x**randint(1, 4), sqrt(x), 1/x, exp(-x)"



before == #|py|
from sympy import atan, Limit
n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []

var('x')
terms = simpify(param['terms'])

def rand_expr(k):
    f = sample(terms, k)
    c = sample([-3, -2, -1, 1, 2, 3], k)
    return sum([c[i]*f[i] for i in range(k)])

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
