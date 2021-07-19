extends = /model/math/expr.pl

before ==
from sympy import integrate
from random import choice, randint
x = Symbol('x')
n = randint(0,100)
f = choice[sin(x),cos(x),x**n,ln(x), 1/x,1/(2*sqrt(x)), e^x]
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$

Attention, pour $!x!$, la réponse $!\frac{x^2}{2}+C!$ n'est pas acceptée. 
Si vous voulez ajouter une constante, il faut donner un réel.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.
