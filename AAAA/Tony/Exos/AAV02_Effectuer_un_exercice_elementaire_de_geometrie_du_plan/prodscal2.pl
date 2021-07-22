title = "Produit scalaire"

extends = /model/math/expr.pl

question ==  
Calculer le produit scalaire de deux vecteurs de norme $!{{p}}!$ et $!{{q}}!$ et d'angle $!\displaystyle {{th|latex}}!$
==
 
  
before ==
from math import pi,cos 
p =  randint(1,5)
q = randint(1,5) 
th = choice([pi/6, pi/4, pi/3, 3*pi/4, 2*pi/3, 5*pi/6])
sol = p*q*cos(th) 
 
==
 

