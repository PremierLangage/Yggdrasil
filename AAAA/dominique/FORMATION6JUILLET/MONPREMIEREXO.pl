
extends = /model/basic/numeric.pl


question==
Calcul le produit de {{ A }} et {{ P }}.

==

sol=0

before==

A = randint(1,5)*10
P = choice([1,2,5,7,11,13])

sol = A * P

==

