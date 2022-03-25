extends = /model/math/expr.pl

before ==
from sympy import Order
var('x')
sol = 1 + x**2 + Order(x**3)
==

equality = ""

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==
