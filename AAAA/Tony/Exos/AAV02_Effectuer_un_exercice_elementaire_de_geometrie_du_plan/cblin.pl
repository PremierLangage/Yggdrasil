title = "Combinaison linéaire"

extends = /model/math/expr.pl

question ==  
Calculer la combinaison linéaire des deux vecteurs $!{{a(p1,p2)}}!$ par $!{{q1,q2}}!$ 
==
 
  
before == 
 

p1,p2 = randint(-2,2),randint(-2,2) 
q1,q2 = randint(-2,2),randint(-2,2) 
a,b = randint(-5,5),randint(-5,5) 

 
sol = 1
==
 

