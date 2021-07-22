extends = /model/math/expr.pl

#TODOO
#ne marche pas : voir comment mettre deux réponses.
title = Addition de fractions

before ==
from sympy import numer, denom
var('x')
f = 1/(x+1)+1/(x+2)
 
lstsol = [numer(f),denom(f)] 
==

text ==
Calculer l'expression $! \displaystyle {{f|latex}} !$ en l'écrivant sous la forme d'une fraction irréductible.
==
