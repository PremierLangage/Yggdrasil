extends = /model/math/expr.pl

before ==
from sympy import O
var('x')
sol = 1 + x**2 + O(x**3)
==

equality = ""

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==
