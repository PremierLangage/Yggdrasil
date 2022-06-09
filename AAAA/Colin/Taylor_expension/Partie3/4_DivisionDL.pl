# Auteur : Colin Petitjean
# Sujet : Quotient de Développements Limités
# Maj : 9/06/2022

title = Quotient de développements limités

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 3

f = choice([1, exp(x), sin(x), ln(1+x), ln(1-x)])
g = choice([1+x+x**2, cos(x), exp(x)])

h=f/g

sol = series(h, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ h|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ h|latex }} = !$
==

solution ==
$! {{ h|latex }} = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'