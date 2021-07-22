title = "Produit scalaire"

extends = /model/basic/numeric.pl

question ==  
if n==2:
    Calculer le produit scalaire de $!{{p}}!$ par $!{{q}}!$ 
==
 
  
before ==
n = choice([2,3])
p =  [randint(-5,5) for i in range(n)]
q = [randint(-5,5) for i in range(n)] 

if n == 2:
    sol = p[0]*q[0] + p[1]*q[1] 
else: 
    sol = p[0]*q[0] + p[1]*q[1] + p[2]*q[2]
==
 
