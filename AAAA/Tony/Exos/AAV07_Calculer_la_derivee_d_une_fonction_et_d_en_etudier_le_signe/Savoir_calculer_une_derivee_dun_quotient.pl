
extends = /model/math/expr.pl

before == 
from sympy import diff
x = Symbol('x')

a = randint(-5,5,[0])
f,g  =  sample([x+a,x**2+a,exp(x),ln(x),sin(x),cos(x),sqrt(x),x**3+a,x**4+a],2) 
h = f/g
sol = diff(h,x)
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la dérivée de

$! h :x\mapsto \displaystyle {{ h|latex }} !$. Si $!\log!$ apparaît, elle désigne le logarithme népérien.
==
 
#solution pour modifier le message de solution
solution == 
La dérivée est {{sol|latex}}
==

message.notExpr==
Ich bin ein berliner
==
 

