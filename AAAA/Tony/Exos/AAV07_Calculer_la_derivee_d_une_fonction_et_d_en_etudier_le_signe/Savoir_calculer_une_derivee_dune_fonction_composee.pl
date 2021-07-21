
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff

x = Symbol('x')

f =  choice([exp(x),ln(x),sin(x),cos(x),sqrt(x+1),tan(x)]) 
g = choice([x**2+1,exp(x),ln(x),sin(x),cos(x),sqrt(x),x**3+2x**2-5,x**4+x-12])
h = f.subs(x,g)
sol = diff(h,x)
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la dérivée de

$! h :x\mapsto \displaystyle {{ h|latex }} !$. La fonction $!\log!$ désigne le logarithme népérien.
==
 
#solution pour modifier le message de solution
solution == 
La dérivée est {{sol|latex}}
==

message.notExpr==
Ich bin ein berliner
==
 

