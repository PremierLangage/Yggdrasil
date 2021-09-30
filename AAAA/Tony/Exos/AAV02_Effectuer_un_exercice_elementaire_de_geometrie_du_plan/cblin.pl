title = "Combinaison linéaire"

extends = /model/math/expr.pl

question ==  
Calculer la combinaison linéaire $!{{a}}(+{{b}}v!$ où $!u={{u|latex}}!$ et $!v = {{v}}!$  
==
 
  
before == 
from numpy import array 
p1,p2 = randint(-2,2),randint(-2,2)
q1,q2 = randint(-2,2),randint(-2,2)
a,b = randint(-5,5),randint(-5,5) 

sol = a * u +b*v
==
 

