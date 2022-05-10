extends = /model/math/multimathinput.pl
title = Calcul de limites

param.terms = "ln(x), exp(x), x**randint(1, 4), sqrt(x), 1/x, exp(-x), 1/ln(x), randint(-2,2,[0])"

param.nbterms = [[2,1], [2,2], [2,2], [2,3]]

before == #|py|
from sympy import Limit
var('x')
terms = eval(param['terms'])
nbterms = param['nbterms']
n = len(nbterms)

inputs = [MathInput() for _ in range(n)]
prefixes = []

def rand_expr(k1, k2):
    sampterms = sample(terms, k1)
    c = sample([-3, -2, -1, 1, 2, 3], k1)
    f = sum([c[i]*sampterms[i] for i in range(k1)])
    sampterms = sample(terms, k2)
    c = sample([-3, -2, -1, 1, 2, 3], k2)
    g = sum([c[i]*sampterms[i] for i in range(k2)])
    return f/g


for i in range(n):
    nb = nbterms[i]
    shuffle(nb)
    lim = Limit(rand_expr(*nb), x, oo)
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
