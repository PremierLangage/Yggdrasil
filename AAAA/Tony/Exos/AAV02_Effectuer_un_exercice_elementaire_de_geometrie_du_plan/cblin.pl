title = "Combinaison linéaire"

extends = /model/math/expr.pl

question ==  
Calculer la combinaison linéaire $!{{a}}u+{{b}}v!$ où $!u={{u|latex}}!$ et $!v = {{v}}!$  
==
 
  
before == 
from numpy import array 
u = array([randint(-2,2),randint(-2,2)])
u = array([1,0])
v = array([[randint(-2,2),randint(-2,2)]]) 
a,b = randint(-5,5),randint(-5,5) 

 
sol = a * u +b*v
==
 

