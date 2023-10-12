# Auteur : Lemarié Valentin
# Sujet : Somme de Développements Limités
# Maj : 13/10/2022

title = Calculs de développements limités
extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 4

h=sqrt((1+sqrt(1+x**2)))

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

latexsettings.order = 'ilex'
