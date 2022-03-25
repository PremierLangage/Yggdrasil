extends = /model/math/expr.pl

before ==
from sympy import O, series, sin, cos
var('x')
f = choice([sin(x), cos(x), 1/(1-x)])
n = randint(2, 3)
sol = series(f, x, 0, n+1).removeO()
==

equality = ""

question ==
DL de $! {{ f|latex }} !$ à l'ordre {{ n }}
==

embed ==
# + o({{ x }}^{{ n }})
==
