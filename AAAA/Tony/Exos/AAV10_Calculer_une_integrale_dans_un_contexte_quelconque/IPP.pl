
#Calcul de primitives.
extends = /model/math/expr.pl

title = Savoir calculer une intégrale connaissant la primitive
#A réglier : sympy n'a pas l'éair  de prendre ln(abs(x)). Pb lié à la valeur absolue.

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
k= randint(1,6)

g = choice([x,x**2])
f = choice([g*sin(k*x),g*cos(k*x),g*exp(k*x), ln(k*x),g*ln(k*x)]) 
sol = integrate(f, (x,0, pi)) 
==

#Type d'intégrale : pol d'ordre 2, fonction d'un multiple de x^2 ou x, u'/u avec u fonction classique


question ==
Calculer l'intégrale suivante

$! \int_0^1 {{ f|latex }}dx !$.
 
==

  


