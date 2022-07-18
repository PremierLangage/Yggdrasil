extends = /model/math/expr.pl

title = Dérivation

before == #|py|
var('x')
g = choice([sin(x), cos(x), exp(x)])
h = choice([x, x**2])
f = g * h
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==