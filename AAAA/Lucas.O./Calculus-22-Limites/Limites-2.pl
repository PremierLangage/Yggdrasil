title = Taux d'accroissement
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

h = choice([Limit(sin(x)/x, x, 0),
    Limit((exp(x)-1)/x, x, 0),
    Limit(ln(x)/(x-1), x, 1),
    Limit(tan(x)/x, x, 0)])

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
