#Calcul de solutions de systèmes de Cauchy d'ordre 1
extends = /model/math/expr.pl

before ==
from sympy import dsolve
from plrandom import randint
x = Symbol('x')  
a= randint(-3,3,[0])

sol = dsolve(diff(f)-ax= sin( k*x) , f(x), ics = ) 
==

#Type d'intégrale : pol d'ordre 2, fonction d'un multiple de x^2 ou x, u'/u avec u fonction classique


question ==
Calculer l'intégrale suivante

$! \int_0^1 {{ f|latex }}dx !$.
 
==

  



