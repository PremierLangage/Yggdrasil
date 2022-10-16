# Auteur : Lemarié Valentin
# Sujet : Somme de Développements Limités
# Maj : 16/10/2022

title = Calculs de développements limités
extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 4

h=x**(1/(ln(x)-1))

sol = series(h, x, 1, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ h|latex }} !$ autour de $! 1 !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o((x-1)^{{ n|latex }}) \quad [x \rightarrow 1]
==

prefix ==
$! {{ h|latex }} = !$
==

solution ==
$! {{ h|latex }} = {{ sol|latex }} + o((x-1)^{{ n|latex }})  \quad [x \rightarrow 1]!$.
==

latexsettings.order = 'ilex'
