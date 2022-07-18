# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 1
# Maj : 10/06/2022

title = Développements asymptotiques 2. 

extends = /model/math/expr.pl

# Problème de puissance avec sqrt(1+x), sqrt(x-1), 1/sqrt(1+x), 1/sqrt(x-1)

before ==
from sympy import series
var('x')
n=2
f = choice([ln(1+x)-ln(x) , ln(x-1)-ln(x), 1/(1+x), x/(x+1), x/(x-1), 1/(1+x**2), 1/(x**2-1), x**2/(1+x**2), x/(1+x**2)])
a=choice([oo])
sol = series(f, x, a, n+1).removeO()
==

question ==
Ecrire le développement asymptotiques de $! {{ f|latex }} !$ autour de $! {{a|latex}} !$ à la précision $! 1/x^{{n|latex }} !$.
==

embed ==
# + o(1/x^{{ n|latex }}) \quad [x \rightarrow {{a|latex}}]
==

prefix ==
$! {{ f|latex }} = !$
==

solution ==
$! {{ f|latex }} = {{ sol|latex }} + o(1/x^{{ n|latex }})  \quad [x \rightarrow {{a|latex}}]!$.
==

# latexsettings.order = 'ilex'





