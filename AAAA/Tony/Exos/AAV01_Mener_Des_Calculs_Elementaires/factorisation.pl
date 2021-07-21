extends = /model/math/poly.pl

title =  Savoir simplifier des expressions (développement, factorisation, identités remarquables, fractions…)


before ==
x = Symbol('x')
a,b,c,d = sample([-3,-2,-1,1,2,3],4)
P = (a*x+b)**2-(c*x+d)**2
Q = (a*x+b)**2-c*a*x-c*b
R = choice([P,Q])
if P == R:
    sol =  ((a+c)*x+(b+d))*((a-c)*x+(b-d)) 
else: 
    sol = (a*x+b)*((a-c*a)*x+(b-c*b))
==

question ==
Factoriser l'expression suivante :
$$ {{ R|latex }}. $$
==

poly_form = "factorized"

