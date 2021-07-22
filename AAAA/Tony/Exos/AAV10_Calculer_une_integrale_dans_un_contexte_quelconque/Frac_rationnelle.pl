 
extends = /model/math/expr.pl

title = Savoir décomposer une fraction rationnelle en éléments simples avec deux ou trois pôles simples

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
a,b,c,d=sample([1,-1,2,-2,3,-3,4,-4],4)  
 

sol = integrate(f, (x,a, b)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{{a|latex}}^{{b|latex}} {{ f|latex }}dx !$.
Afin de taper le nombre $!\pi!$, écrivez simplement pi en toutes lettres. 
==
 
  



