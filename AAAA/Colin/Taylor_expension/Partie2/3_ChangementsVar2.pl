# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 4 : Changements de variables et intégration termes à termes
# Maj : 9/06/2022

title = DL - Changements de variables et fonctions logarithmes

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = randint(3, 4)
p=randint(1,3)
a=choice([-2,-1,1,2])

y=a*x**p
f = choice([ln(1+y),ln(1-y)])

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



