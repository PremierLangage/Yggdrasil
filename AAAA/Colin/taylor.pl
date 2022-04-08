extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
f = choice([sin(x), cos(x), exp(x), 1/(1-x)])
n = randint(3, 4)
sol = series(f, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de de $! {{ f|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n }} !$.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'
