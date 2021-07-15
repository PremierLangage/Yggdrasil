
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff, integrate, sin

x = Symbol('x')
 
f = x*sin(x) 
sol = integrate (f,x) 
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==
 

 
evaluator == 
if diff(ans-sol,x) == 0:
    score = 100
else : 
    feedback = f"T es nul c'est {sol}"
==

