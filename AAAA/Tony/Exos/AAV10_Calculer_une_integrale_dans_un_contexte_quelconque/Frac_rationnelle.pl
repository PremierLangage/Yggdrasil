 
extends = /model/math/expr.pl

title = Savoir décomposer une fraction rationnelle en éléments simples avec deux ou trois pôles simples

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
a,b,c,d=sample([1,-1,2,-2,3,-3],4)  
f = 1/((a*x+b)*(c*x+d)) 

sol = integrate(f, (x,0,1/4)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{0}^{\frac{1}{4}} {{ f|latex }}dx !$. 
==
 
  



