# Auteur : Colin Petitjean
# Sujet : Développements Limités - Manipuler les formules de références 2 : Changements de variables

title = DL - Formules de références 1

extends = /model/math/expr.pl

before ==
from sympy import series
var('x')
f = choice([sin(x), cos(x), exp(x), 1/(1-x) , 1/(1+x),(1+x)**(1/2),(1+x)**(-1/2)])
n = randint(3, 4)
p=randint(1,2,3)
a=choice([-2,-1,2])
g(x)=f(a*x**p)

sol = series(g, x, 0, n+1).removeO()
==

question ==
Ecrire le développement limité de $! {{ g|latex }} !$ autour de $! 0 !$ à l'ordre $! {{ n|latex }} !$.
==

embed ==
# + o(x^{{ n|latex }}) \quad [x \rightarrow 0]
==

prefix ==
$! {{ g|latex }} = !$
==

solution ==
$! {{ g|latex }} = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'


