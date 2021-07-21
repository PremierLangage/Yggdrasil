extends = /model/math/poly.pl

title =  Savoir simplifier des expressions (développement, factorisation, identités remarquables, fractions…)


before ==
x = Symbol('x')
P = (a*x+b)**2-(c*x+d)**2
Q = (a*x+b)**2-c*a*x-c*b

sol = choice()
 
==

question ==
Factoriser l'expression suivante :
$$ {{ sol|latex }}. $$
==

poly_form = "factorized"

