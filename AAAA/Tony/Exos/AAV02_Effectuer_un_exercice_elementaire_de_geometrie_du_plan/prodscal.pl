title = "Produit scalaire"

extends = /model/basic/input.pl

question ==  
Calculer le produit scalaire de $!{{p[0],p[1]}}!$ par $!{{(q[0],q[1])}}!$ 

==
 
  
before ==
n = choice([2,3])
p =  [randint(-5,5) for i in range(n)]
q = [randint(-5,5) for i in range(n)] 
sol = p[0]*q[0] + p[1]*q[1]
==
 
