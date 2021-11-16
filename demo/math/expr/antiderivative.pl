extends = /model/math/expr.pl

before ==
import random
from sympy import integrate
x = Symbol('x')
f = random.choice([sin(x), cos(x),ln(x),exp(x)]) 
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.