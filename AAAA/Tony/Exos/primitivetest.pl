
extends = /model/math/expr.pl

before ==
from sympy import Symbol, diff, integrate, sin

x = Symbol('x')
 
f = sin(x) 
sol = integrate (f,x) 
==

#Double dollar pour mettre le latex centré.
question ==
Déterminer une primitive de 

$! f \mapsto \displaystyle {{ f|latex }} !$
==
  

evaluator ==  
from sympy import diff
 
if diff(ans-sol,x) == 0:
    score = 100
else: 
    score = 0
    feedback = f"T es nul c'est {sol}"
==


#Ne marchait pas car il fallait convertir la chaîne latex en objet sympy.
