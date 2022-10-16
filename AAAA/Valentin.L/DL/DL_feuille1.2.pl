# Auteur : Lemarié Valentin
# Sujet : Somme de Développements Limités
# Maj : 16/10/2022

title = Calculs de développements limités
extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 4

h=ln(sin(x)/x)

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
