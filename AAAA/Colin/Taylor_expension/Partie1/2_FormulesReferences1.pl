# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 1
# Maj : 9/06/2022

title = DL - Formules de références 1

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
f = choice([sin(x), cos(x), exp(x), 1/(1-x) , 1/(1+x)])
n = randint(3, 4)
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

