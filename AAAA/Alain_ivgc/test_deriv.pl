extends = /model/math/expr.pl

before ==
from sympy import diff
var('x')
g = choice([sin(x), cos(x), exp(x), tan(x)])
h = choice([1, x, x**2])
f = g * h
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==