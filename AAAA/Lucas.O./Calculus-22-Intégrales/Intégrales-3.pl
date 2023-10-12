title = Changement de variables
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')

a = randint(1, 5)
b = randint(a+1, 10)

h = choice([Integral(exp(2*x)*sin(exp(x)), (x, a, b)),
    Integral((cos(x))**3, (x, a, b)), 
    Integral(sqrt(x)/(x+1)**2, (x, a, b))])

if h == Integral(exp(2*x) * sin(exp(x)), (x, a, b)) :
    y = exp(x)
if h == Integral((cos(x))**3, (x, a, b)) :
    y = sin(x)
if h == Integral(sqrt(x)/(x+1)**2, (x, a, b)) :
    y = sqrt(x)

sol = h.doit()
==

question ==
Calculer l'intégrale suivante, en faisant le changement de variable $! u = {{ y|latex }} !$.
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'

