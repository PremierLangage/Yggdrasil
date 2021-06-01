extends = /model/math/expr.pl

title = Calculer la dérivée d'une fonction

before ==
from sympy import diff
var('x')
g = choice([sin(x), cos(x), exp(x)])
h = choice([x, x**2])
f = g * h
sol = diff(f, x)
toto = "blabla"
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$

{{ toto }}
==