extends = /model/math/expr.pl

before ==
from sympy import O, series, sin, cos
var('x')
f = choice([sin(x), cos(x)])
n = randint(2, 3)
sol = series(f, x, 0, n+1)
==

equality = ""

question ==
DL de $! {{ f|latex }} !$ à l'ordre {{ n }}
==

embed ==
# + o({{ x }}^{{ n }})
==
