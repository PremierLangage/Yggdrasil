title = "Combinaison linéaire"

extends = /model/math/expr.pl

question ==  
Calculer la combinaison linéaire $!{{a}}u+{{b}}v!$ où $!u={{u}}!$ et $!v = {{v}}!$  
==
 
  
before == 
from sympy import Matrix 
x, x1, x2, x3 = symbols('x x1 x2 x3')
u = Matrix([randint(-2,2),randint(-2,2)])
v = Matrix([randint(-2,2),randint(-2,2)]) 
a,b = randint(-5,5),randint(-5,5) 

 
sol = a * u +b*v
==
 

