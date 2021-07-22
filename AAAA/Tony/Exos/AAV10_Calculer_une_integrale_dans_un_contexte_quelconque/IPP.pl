 
extends = /model/math/expr.pl

title = Savoir trouver les fonctions pour faire une IPP

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
k= randint(1,6)

g = choice([x,x**2])
f = choice([g*sin(k*x),g*cos(k*x),g*exp(k*x), ln(k*x),g*ln(k*x)]) 
sol = integrate(f, (x,0, pi)) 
==
 


question ==
Calculer l'intégrale suivante

$!\displaystyle \int_0^{\pi} {{ f|latex }}dx !$.
 
==

  


