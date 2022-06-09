# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 3 : Intégration termes à termes. 
# Maj : 9/06/2022

title = DL - Formules de références 3 - Intégration termes à termes 


extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 3

f = choice([ln(1+x),ln(1-x),atan(x),asin(x),acos(x)])

sol = series(f, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ f|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n|latex }} !$.
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



