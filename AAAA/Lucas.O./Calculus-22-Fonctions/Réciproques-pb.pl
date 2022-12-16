title = Fonctions réciproques
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')
var('a')

x0 = choice([pi/3, 3*pi/5, 5*pi/7, 8*pi/10, -3*pi/4, -2*pi, -15*pi/6])
h = choice([acos(cos(x)), asin(sin(x)), atan(tan(x))])

sol = h.subs(x, x0)
==

question ==
Calculer $! {{ h|latex }} !$ en $! x = {{ x0|latex }} !$
==

embed ==
==

prefix ==
==

latexsettings.order = 'ilex'
