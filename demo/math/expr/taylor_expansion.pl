extends = /model/math/expr.pl

before ==
from sympy import O, series, sin, cos, exp
var('x')
f = choice([sin(x), cos(x), exp(x) 1/(1-x)])
n = randint(2, 3)
sol = series(f, x, 0, n+1).removeO()
==

equality = ""

question ==
Ecrire le développement limité de de $! {{ f|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n }} !$.
==

embed ==
# + o({{ x }}^{{ n }})
==
