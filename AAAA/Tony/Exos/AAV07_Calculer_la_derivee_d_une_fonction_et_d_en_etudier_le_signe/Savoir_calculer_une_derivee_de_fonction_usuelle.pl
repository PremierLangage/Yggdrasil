

extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff

x = Symbol('x')
n = randint(1,10)
f =  choice([exp(x),ln(x),sin(x),cos(x),sqrt(x),tan(x),1/x,x**n])   
sol = diff(f,x)
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer la dérivée de

$! h :x\mapsto \displaystyle {{ f|latex }} !$. La fonction $!\log!$ désigne le logarithme népérien.
==
 
#solution pour modifier le message de solution
solution == 
La dérivée est {{sol|latex}}
==

message.notExpr==
Ich bin ein berliner
==
 

