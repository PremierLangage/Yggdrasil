 
extends = /model/math/expr.pl

title = Savoir trouver les fonctions pour faire une IPP

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
k= randint(1,6)

dico = {}
dico[ln(k*x)]=[1,exp(1)]
dico[x*ln(k*x)]=[1,exp(1)]
L = [x*sin(k*x),x*cos(k*x),x*exp(k*x),x**2*sin(k*x),x**2*cos(k*x),x**2*exp(k*x)] 
for elt in L:
    dico[elt] = [0,pi]

f = choice(dico.keys()) 
sol = integrate(f, (x,0, pi)) 
==
 


question ==
Calculer l'intégrale suivante

$!\displaystyle \int_0^{\pi} {{ f|latex }}dx !$.
 
==

  


