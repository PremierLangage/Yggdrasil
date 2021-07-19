extends = /model/math/expr.pl

before ==
from sympy import integrate
x = Symbol('x')
f = sin(x) 
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.
