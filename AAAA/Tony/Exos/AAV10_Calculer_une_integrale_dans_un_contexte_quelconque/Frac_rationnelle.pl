 
extends = /model/math/expr.pl

title = Savoir décomposer une fraction rationnelle en éléments simples avec deux ou trois pôles simples

before ==
from sympy import integrate,diff
from plrandom import   randint
x = Symbol('x')  
a = randint(-2,2,[0])
b = choice([-3,3,-4,4,-5,5])
c = randint(-2,2,[0,a])
d = choice([-3,3,-4,4,-5,5])
f = 1/((a*x+b)*(c*x+d)) 

sol = integrate(f, (x,0,1)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{0}^{\frac{1}{4}} {{ f|latex }}dx !$. 
==
 
  



