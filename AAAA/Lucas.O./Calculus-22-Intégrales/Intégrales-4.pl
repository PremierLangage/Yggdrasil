title = Décomposition en éléments simples
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')
var('A')
var('B')
var('C')
var('D')

a = randint(1, 5)
b = randint(a+1, 10)

c = randint(1, 6)
d = randint(1, 4)

h = choice([Integral(c/((x+1)*(x+2)), (x, a, b)),
    Integral(d/(x**2 + 5*x + 6), (x, a, b)), 
    Integral((c*(x**3) + d*(x**2) + (c-d)*x)/(x**2 + 1), (x, a, b))])

if h == Integral(c/((x+1)*(x+2)), (x, a, b)) :
    y = A/(x+1) + B/(x+2)
if h == Integral(d/(x**2 + 5*x + 6), (x, a, b)) :
    y = A/(x+2) + B/(x+3)
if h == Integral((c*(x**3) + d*(x**2) + (c-d)*x)/(x**2 + 1), (x, a, b)) :
    y = A*x + B + (C*x)/(x**2 + 1) + D/(x**2 + 1)

sol = h.doit()
==

question ==
Calculer l'intégrale suivante, en mettant sous la forme $! {{ y|latex }} !$.
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'

