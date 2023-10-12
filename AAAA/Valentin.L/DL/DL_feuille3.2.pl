# Auteur : Lemarié Valentin
# Sujet : Somme de Développements Limités
# Maj : 16/10/2022

title = Calculs de développements limités
extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 4
p=Rational(1,3)
h=(x**3+x)**p-(x**3-x)**p
sol = series(h, x, oo, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ h|latex }} !$ autour de $! +\infty !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o((1/x)^{{ n|latex }}) \quad [x \rightarrow +\infty]
==

prefix ==
$! {{ h|latex }} = !$
==

solution ==
$! {{ h|latex }} = {{ sol|latex }} + o((1/x)^{{ n|latex }})  \quad [x \rightarrow \infty]!$.
==

latexsettings.order = 'ilex'
