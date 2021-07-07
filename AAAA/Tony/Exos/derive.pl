
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff, sin

x = Symbol('x')
 
f = x^2*sin(x)
sol = diff(f,x)
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la dérivée de

$! f \mapsto \displaystyle {{ f|latex }} = !$
==
 
