# Auteur : Lemarié Valentin
# Sujet : Somme de Développements Limités
# Maj : 13/10/2022

title = Calculs de développements limités
extends = /model/math/expr.pl

before ==
from sympy import series
var('x')

n = 5
a=choice([-2,-1,1,2])
b=choice([-2,-1,1,2])
alpha=choice([2,3,4,5])
p=choice([2,3])
q=choice([1,2,3])

y= x**p
z= x**q

f = choice([1/(1+y), exp(y), cos(y), sin(y), ln(1+y),(1+y)**alpha])
g = choice([1/(1+z), exp(z), cos(z), sin(z), ln(1+z),(1+z)**alpha])

h=a*f+b*g

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

solution ==
$! {{ h|latex }} = {{ sol|latex }} + o(x^{{ n|latex }})  \quad [x \rightarrow 0]!$.
==

latexsettings.order = 'ilex'