extends = /model/math/expr.pl

before ==
from sympy import Symbol, sin, cos, diff
x = Symbol('x')
n = randint(1, 3)
f = x**n * choice([sin(x), cos(x)])
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==