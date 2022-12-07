title = Changement de variables
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n = randint(2, 10)
p = randint(2, 10)

h = choice([Limit(sin(n*x)/ln(1+p*x), x, 0),
    Limit((exp(x**p))/(x**n - 3), x, +oo)])

sol = h.doit()
==

question ==
Donner la limite suivante.
==

embed ==
==

prefix ==
$! {{ h|latex }} = !$
==

latexsettings.order = 'ilex'
