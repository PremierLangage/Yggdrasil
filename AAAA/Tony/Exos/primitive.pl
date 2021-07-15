
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff, sin

x = Symbol('x')
 
f = x*sin(x) 
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==
 
#solution pour modifier le message de solution
solution == 
La dérivée est {{sol|latex}}
==
 
evaluator == 
if diff(ans,x) == f:
    score = 100
else : 
    feedback = f"T es nul c'est {sol}"
==

