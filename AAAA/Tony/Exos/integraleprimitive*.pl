#Calcul de primitives.
extends = /model/math/expr.pl

#A réglier : sympy n'a pas l'éair  de prendre ln(abs(x)). Pb lié à la valeur absolue.

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x') 
d1,d2,d3 = randint(-5,5),randint(-5,5),randint(-5,5)
k= randint(1,6)

f = choice([sin(k*x),cos(k*x),x**k, exp(k*x), d1*x**2+d2*x+d3, x*exp(k*x**2),  x*cos(k*x**2),  x*sin(k*x**2), diff(d1*x**2+d2*x+d3)/(d1*x**2+d2*x+d3)])

sol = integrate(f, 0, 1) 
==

#Type d'intégrale : pol d'ordre 2, fonction d'un multiple de x^2 ou x, u'/u avec u fonction classique


question ==
Calculer l'intégrale suivante

$! \int_0^1 {{ f|latex }}dx !$.
 
==

  


