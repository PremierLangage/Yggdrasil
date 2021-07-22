title = "Produit scalaire"

extends = /model/math/expr.pl

question ==  
Calculer le produit scalaire de deux vecteurs de norme $!{{p}}!$ et $!{{q}}!$ et d'angle $!\displaystyle {{th|latex}}!$
==
 
  
before ==
from math import pi,cos 
p =  randint(1,5)
q = randint(1,5)
th =  pi/choice([1,2,3,4,6])
sol = p*q*cos(th) 
 
==
 

