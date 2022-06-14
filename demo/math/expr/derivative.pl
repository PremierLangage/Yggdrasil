extends = /model/math/expr.pl

title = Dérivation

before ==
var('x')
g = choice([sin, cos, exp])
n = randint(5, 10)
h = choice([x, x**n])
f = g(x) * h
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==