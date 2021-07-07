extends = /model/math/expr.pl

before ==
from sympy import Symbol, sin, diff
x = Symbol('x')
f = x**2
sol = diff(f, x)
==

question ==
Calculer la dérivée de la fonction 
$$ f : x \mapsto {{ f|latex }} .$$
==

solution ==
La dérivée est $! {{ sol|latex }} !$.
==

message.NotExpr = "La réponse n'est pas compréhensible."

