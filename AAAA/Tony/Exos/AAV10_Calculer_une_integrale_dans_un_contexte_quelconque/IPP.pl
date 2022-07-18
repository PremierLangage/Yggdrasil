 
extends = /model/math/expr.pl

title = Savoir trouver les fonctions pour faire une IPP

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
k= randint(1,6)

f = choice([x*sin(k*x),x*cos(k*x),x*exp(k*x),x**2*sin(k*x),x**2*cos(k*x),x**2*exp(k*x),ln(k*x), x*ln(k*x)])
if f in [ln(k*x),x*ln(k*x)]:
    a,b = 1,exp(1)  
else:
    a,b = 0,pi

sol = integrate(f, (x,a, b)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{{a|latex}}^{{b|latex}} {{ f|latex }}dx !$.
Afin de taper le nombre $!\pi!$, écrivez simplement pi en toutes lettres. 
==
 
  


