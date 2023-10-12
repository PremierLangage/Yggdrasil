title = Encadrement
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n = randint(1, 10)
p = randint(1, 10)

h = choice([Limit(sin(p*x)/x, x, +oo),
    Limit(x**n * (1 + cos(1 - 1/x)), x, 0)])

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
