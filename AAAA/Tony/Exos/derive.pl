
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff, sin

x = Symbol('x')


f,g  =  sample([x,x**2+1,exp(x),ln(x),sin(x),cos(x),sqrt(x),1/x,x**3,x**4],2) 
h = f*g
sol = diff(h,x)
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la dérivée de

$! f \mapsto \displaystyle {{ f|latex }} !$
==
 
#solution pour modifier le message de solution
solution == 
La dérivée est {{sol|latex}}
==

message.notExpr==
Ich bin ein berliner
==
 
