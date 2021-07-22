 
extends = /model/math/expr.pl

title = Savoir décomposer une fraction rationnelle en éléments simples avec deux ou trois pôles simples

before ==
from sympy import integrate,diff
from random import choice, randint
x = Symbol('x')  
k= randint(1,6)
 

sol = integrate(f, (x,a, b)) 
==
 

question ==
Calculer l'intégrale suivante

$!\displaystyle \int_{{a|latex}}^{{b|latex}} {{ f|latex }}dx !$.
Afin de taper le nombre $!\pi!$, écrivez simplement pi en toutes lettres. 
==
 
  



