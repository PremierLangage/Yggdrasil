extends = /model/math/expr.pl

before ==
from sympy import Symbol, sin, diff
x = Symbol('x')
f = x**2 * sin(x)
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==

