extends = /model/math/multimathinput.pl
title = Calcul de limites

param.terms = "ln(x), exp(x), x**randint(1, 4), sqrt(x), 1/x, exp(-x), 1/ln(x), randint(-2,2,[0])"

param.nbterms = [2, 2, 2, 3]

before == #|py|
from sympy import Limit
var('x')
terms = eval(param['terms'])
nbterms = param['nbterms']
n = len(nbterms)

inputs = [MathInput() for _ in range(n)]
prefixes = []

def rand_expr(k):
    f = sample(terms, k)
    c = sample([-3, -2, -1, 1, 2, 3], k)
    return sum([c[i]*f[i] for i in range(k)])


for i in range(n):
    lim = Limit(rand_expr(nbterms[i]), x, oo)
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
