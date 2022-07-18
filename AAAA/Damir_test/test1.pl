extends=/model/math/expr.pl

title = Dérivation

before ==
from sympy import diff
var('x')
a=3
g = choice([sin(x), cos(x), exp(x)])
h = choice([x, x**a])
f = g * h
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==