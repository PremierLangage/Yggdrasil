# Auteur : Colin Petitjean
# Sujet : Composition de Développements Limités
# Maj : 9/06/2022

title = Composition de développements limités

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 3

g = choice([exp(x)-1, cos(x)-1, sin(x), ln(1+x), ln(1-x)])
f = choice([1/(1+g), 1/(1-g), ln(1+g), ln(1-g), cos(g), sin(g), ln(1+g), ln(1-g)])

sol = series(f, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $!\;  {{ f|latex }} \;!$ autour de $! 0 !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ f|latex }} = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'