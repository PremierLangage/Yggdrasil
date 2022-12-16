title = Croissances comparées, facteur dominant
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
from sympy import Integral
var('x')

h1 = (3* x**2 + 1)(x**3 + x + 1)**2
h2 = ln(x)/x
h3 = 2*x*exp(x**2)

a = randint(1, 4)
b = randint(5, 7)

h = integrate(choice([h1, h2, h3]), (x, a, b))
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

