title = Intégrales
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')

a = randint(1, 4)
b = randint(5, 7)

c = randint(1, 3)
d = randint(1, 7)

h = Integral(choice([(c * x**2 + d)*(c*(x**3)/3 + d*x + 1)**2, ln(x)/x, 2*x*exp(x**2)]), (x, a, b))

sol = h.doit()
==

question ==
Calculer l'intégrale suivante.
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'