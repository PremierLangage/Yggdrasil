title = Intégration par parties
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')

a = randint(1, 5)
b = randint(a+1, 10)

h = Integral(choice([x*exp(x), 2*atan(x), x*ln(x)]), (x, a, b))

sol = h.doit()
==

question ==
Calculer l'intégrale suivante, en faisant une intégration par parties.
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'
