#Calcul de solutions de systèmes de Cauchy d'ordre 1
extends = /model/math/expr.pl

before ==
from sympy import dsolve
from plrandom import randint

sol = 1
==
#x = Symbol('x')  
#a= randint(-3,3,[0])
#b= randint(2,5)
#sol = dsolve(diff(f)-ax= sin( b*x) , f(x), ics = {subs(f,x,0):1}) 
 


question ==
Résoudre l'équation différentielle 
==
#$!y'-{{a|latex}}y=sin({{b|latex}}x)!$

  



