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

Attention, pour $!x!$, la réponse $!\frac{x^2}{2}+C!$ n'est pas acceptée. Si vous voulez ajouter une constante, il faut donner un réel.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.
