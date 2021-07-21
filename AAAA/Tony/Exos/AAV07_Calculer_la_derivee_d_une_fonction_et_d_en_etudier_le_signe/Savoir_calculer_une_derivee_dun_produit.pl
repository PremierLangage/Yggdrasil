
extends = /model/math/expr.pl

title = Savoir calculer une dérivée d'un produit

before ==
from sympy import Symbol, diff, sin

x = Symbol('x')


f,g  =  sample([x,x**2+1,exp(x),ln(x),sin(x),cos(x),sqrt(x),x**3,x**4],2) 
h = f*g
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
 
