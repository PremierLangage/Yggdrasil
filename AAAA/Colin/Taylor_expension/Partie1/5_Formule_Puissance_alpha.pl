# Auteur : Colin Petitjean
# Sujet : Développements Limités - Fonction Puissance alpha

title = DL - Formules de références : Fonctions puissances

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
f = choice([sin(x), cos(x), exp(x), 1/(1-x) , 1/(1+x)])
n = randint(2, 3)
sol = series(f, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ f|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n }} !$.
==

embed ==
# + o({{ x }}^{{ n }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ f|latex }} = {{ sol|latex }} + o({{ x }}^{{ n }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'

