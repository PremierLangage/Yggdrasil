extends = /model/math/expr2.pl

before ==
from sympy import integrate
x = Symbol('x')
f = choice([sin(x), cos(x),ln(x),exp(x)]) 
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.