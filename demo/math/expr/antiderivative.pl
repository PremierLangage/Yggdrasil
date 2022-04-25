extends = /model/math/expr.pl

before ==
from sympy import integrate
var('x')
f = choice([sin(x), cos(x), ln(x), exp(x)]) 
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de $ f \mapsto \displaystyle {{ f|latex }} $.
==

equality = "UpToConstant"

message.NotEqual = "La réponse n'est pas une primitive."