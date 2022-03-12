extends = /model/math/multinput.pl

title = Calcul de limites

question ==
Calculer les limites suivantes.
==

before == #|py|
from sympy import Limit
n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []
var('x')

n1,n2=sampleint(1, 5, 2)   
lstf=[[x**n1,exp(x)],[x**n2,ln(x)],[exp(x),ln(x)]]
shuffle(lstf)

for i in range(n):
    n0=randint(1,5)   
    g = [x**n0, exp(x), ln(x)]
    shuffle(g)
    f = choice([g[0]/(g[1]-g[2]),(g[0]-g[1])/g[2]])
    lim = Limit(f, x, oo)
    s = latex(lim)
    prefixes.append(f"$! \displaystyle {s} = !$")
    inputs[i].sol = lim.doit()
    inputs[i].type = "expr"
    inputs[i].evalparam = {}
==