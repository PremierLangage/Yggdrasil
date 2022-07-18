# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 1
# Maj : 10/06/2022

title = Développements Limités en $!a \neq 0!$.

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
n=2
f = choice([exp(x), 1/x, 1/x**2, ln(x), sqrt(x), 1/sqrt(x)])
a = choice([1,2])
sol = series(f, x, a, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ f|latex }} !$ autour de $! {{a|latex}} !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow {{a|latex}}]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ f|latex }} = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow {{a|latex}}]!$.
==

latexsettings.order = 'ilex'


