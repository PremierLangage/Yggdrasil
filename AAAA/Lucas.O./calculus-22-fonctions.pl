title = Limites de base
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n = 4

h = choice([Limit(exp(x), x, +oo), Limit(ln(x), x, 0),
    Limit(x^3, x, +oo)])

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
