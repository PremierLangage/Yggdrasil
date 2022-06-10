# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 1
# Maj : 10/06/2022

title = Développements asymptotiques 1. 

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
n=2
f = choice([exp(1/x), ln(1+1/x) , ln(1- 1/x), 1/(1+1/x) , 1/(1-1/x), 1/(1+1/x**2), 1/(1-1/x**2), sqrt(1+1/x), 1/sqrt(1+1/x), sqrt(1-1/x), 1/sqrt(1-1/x)])
a=choice([oo,-oo])
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




