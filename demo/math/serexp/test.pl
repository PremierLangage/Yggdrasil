extends = /model/math/expr.pl

before ==
from sympy import O, series, sin, cos
var('x')
f = choice([sin, cos])
n = randint(2, 3)
sol = series(f, x, 0, n)
==

equality = ""

question ==
DL de $! {{ f|latex }} !$ à l'ordre {{ n }}
==
