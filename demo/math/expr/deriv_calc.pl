extends = /model/math/expr.pl

title = Calculer la dérivée d'une fonction

before ==
var('x')
n = randint(-3, 3, [0])
g = randitem(sympify([sin(x), cos(x), exp(x))
h = randitem(sympify([x, x**2])
f = n*g*h
sol = diff(f, x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f|latex}} .$$
==