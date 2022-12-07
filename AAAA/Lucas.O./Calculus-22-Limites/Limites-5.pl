title = Quantité conjuguée
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

p = randint(1, 10)
n = randint(1, 10)

h = choice([Limit(sqrt(n*x + p) - sqrt(x), x, +oo),
    Limit((sqrt(x)*p)/(sqrt(n*x - p) - sqrt(x)), x, +oo)])

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

