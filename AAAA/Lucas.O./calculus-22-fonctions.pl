title = Limites
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n = 4

h = Limit(exp(x), x, 0)

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
