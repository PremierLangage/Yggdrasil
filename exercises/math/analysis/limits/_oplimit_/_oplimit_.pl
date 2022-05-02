extends = /model/math/multimathinput.pl
title = Calcul de limites

param.form = [0, 1, 2]

# Paramètres
# 1 : inf - inf
# 2 : inf + inf
# 3 : inf + f
# 4 : inf + b

# 1 : inf * inf
# 2 : bc * inf
# 3 : fnz * inf
# 4 : 0 * inf



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
    inf1, inf2 = sample(inf, 2)
    f1, f2 = sample(f, 2)
    b1, b2 = sample(b, 2)
    f01, f02 = sample(f0, 2)
    if i == 0:
        return inf1 - inf2
    elif i == 1:
        return choice([-1, 1])*inf1 + choice([-1, 1])*f1
    elif i == 2:
        return choice([-1, 1])*inf1 + choice([-1, 1])*b1
    elif i == 3:
        return f01*inf1

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
