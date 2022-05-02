extends = /model/math/multimathinput.pl

title = Calcul de limites

question ==
Calculer les limites suivantes.
==

before ==
from sympy import Limit
from randsympy import randpoly

n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []

var('x')

d0=randint(2,7)
d = [[d0,d0]]+[[randint(2,7),randint(2,7)] for _ in range(2)] 
pts = [oo, oo, -oo, -oo]
shuffle(pts)

for i in range(n):
    f = randpoly(d[i][0],randint(2,3),5)
    g = randpoly(d[i][1],randint(2,3),5)
    lim = Limit(f/g, x, pts[i])
    s = latex(lim)
    prefixes.append(f"$! \displaystyle {s} = !$")
    inputs[i].sol = lim.doit()
    inputs[i].type = "expr"
    inputs[i].evalparam = {}
==


