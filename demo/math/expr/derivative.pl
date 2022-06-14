extends = /model/math/expr.pl

title = Dérivation

before ==
var('x')
g = choice([sin(x), cos(x), exp(x)])
n = randint(1,5)
h = choice([x, x**n])
f = g * h
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==