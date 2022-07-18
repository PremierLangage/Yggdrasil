#Calcul de solutions de systèmes de Cauchy d'ordre 1
extends = /model/math/expr.pl

before ==
from sympy import dsolve
from plrandom import randint
a= randint(-3,3,[0])
b= randint(2,5)
y = Symbol('y')
eq = y'-a*y-sin(b*x)  
sol = 1
==


#x = Symbol('x')  

#sol = dsolve(diff(f)-ax= sin( b*x) , f(x), ics = {subs(f,x,0):1}) 
 


question ==
Résoudre l'équation différentielle $!{{eq|latex}}!$
==


  



