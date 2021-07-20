#Calcul de solutions de systèmes de Cauchy d'ordre 1
extends = /model/math/expr.pl

before ==
from sympy import dsolve
from plrandom import randint
x = Symbol('x')  
a= randint(-3,3,)

f = choice([sin(k*x),cos(k*x),x**k, exp(k*x), d1*x**2+d2*x+d3, x*exp(k*x**2),  x*cos(k*x**2),  x*sin(k*x**2), k*diff(d1*x**2+d2*x+d3)/(d1*x**2+d2*x+d3)])

sol = dsolve(diff(f)-ax= sin( k*x) , f(x), ics = ) 
==

#Type d'intégrale : pol d'ordre 2, fonction d'un multiple de x^2 ou x, u'/u avec u fonction classique


question ==
Calculer l'intégrale suivante

$! \int_0^1 {{ f|latex }}dx !$.
 
==

  



