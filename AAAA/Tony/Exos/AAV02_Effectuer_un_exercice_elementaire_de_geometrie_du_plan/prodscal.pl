title = "Produit scalaire"

extends = /model/math/expr.pl

question ==  
Calculer le produit scalaire des deux vecteurs $!({{p}})!$ par $!({{q}})!$ 
==
 
  
before == 

for in 
p1,p2 = randint(-5,5),randint(-5,5) 
q1,q2 = randint(-5,5),randint(-5,5)
 
sol = p1*q1+p2*q2  
==
 
