extends = /model/math/expr.pl

before ==
from sympy import integrate,sin,cos, ln, sqrt, exp 
from random import choice, randint
x = Symbol('x')
n = randint(0,100)
f = choice([sin(x),cos(x),x**n,ln(x), 1/x,1/(2*sqrt(x)), exp(x)])
sol = integrate(f, x) 
==

question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$.

Attention,il ne faut pas utiliser la notation $!C!$. 
Si vous voulez ajouter une constante à votre fonction, il faut donner un réel.
==

equality = "UpToConstant"

message.NotEqualUpToConstant = La réponse n'est pas une primitive.
