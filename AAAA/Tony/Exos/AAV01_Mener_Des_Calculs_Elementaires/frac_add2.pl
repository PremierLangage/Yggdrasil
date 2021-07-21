extends = /model/math/expr.pl

title = Addition de fractions

before ==
from sympy import cancel
var('x')
f = 1/(x+1)+1/(x+2)
 

 
sol = f.expand()
==

text ==
Calculer l'expression $! \displaystyle {{sol|latex} !$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==
