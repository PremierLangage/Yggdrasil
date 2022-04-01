extends = /model/math/expr.pl

before ==
from sympy import O, series
var('x')
f = choice([sin(x), cos(x), exp(x), 1/(1-x)])
n = randint(5, 6)
sol2 = series(f, x, 0, n+1)
sol = sol2.removeO()
==

equality = ""

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
Le DL de $! {{f|latex}} !$ est $! {{sol2|latex }} !$.
==


latexsettings.order = 'ilex'