extends = /model/math/expr.pl

title = Calculer la dérivée d'une fonction

before ==
from sympy import diff
var('x')
t = "blabla"
g = choice([sin(x), cos(x), exp(x)])
h = choice([x, x**2])
f = g * h
sol = diff(f, x)
==

text ==
Calculer la dérivée de la fonction $$ f : x \mapsto {{ f|latex }} .$$
==

input_prefix = $! f'(x) = !$