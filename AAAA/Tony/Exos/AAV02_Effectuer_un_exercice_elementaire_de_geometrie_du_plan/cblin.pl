title = "Combinaison linéaire"

extends = /model/math/set.pl

question ==  
Calculez les coordonnées de la combinaison linéaire $!{{a}}({{p1}},{{p2}})+{{b}}({{q1}},{{q2}})!$.  
==
 
  
before == 
from numpy import array 
p1,p2 = randint(-2,2),randint(-2,2)
q1,q2 = randint(-2,2),randint(-2,2)
a,b = randint(1,5),randint(1,5) 

sol = [a*p1 + b*p2 , a*q1 + b*q2]
==
 

