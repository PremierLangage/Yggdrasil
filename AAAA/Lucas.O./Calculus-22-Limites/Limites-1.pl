title = Croissances comparées, facteur dominant
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')

n1 = randint(1, 10)
m1 = randint(1, 10)
p1 = randint(1, 10)

n2 = randint(1, 10)
m2 = randint(1, 10)
p2 = randint(1, 10)

h = Limit((exp(x)**n1 + x**m1 + ln(x)**p1)/(x**n2 + exp(x)**m2 + ln(x)**p2), x, +oo)

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
