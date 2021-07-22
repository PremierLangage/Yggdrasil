 
extends = /model/math/expr.pl

title = Savoir décomposer une fraction rationnelle en éléments simples avec deux ou trois pôles simples

before ==
from sympy import integrate,diff
from plrandom import   randint
x = Symbol('x')  
a = randint(-3,3,[0])
b = randint(-3,3,[0])
c = randint(-3,3,[0,a])
d = randint(-3,3,[0,d]) 
f = 1/((a*x+b)*(c*x+d)) 

sol = integrate(f, (x,0,1/4)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{0}^{\frac{1}{4}} {{ f|latex }}dx !$. 
==
 
  



