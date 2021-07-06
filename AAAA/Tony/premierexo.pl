#Modèle prédéfini 
extends = /model/basic/numeric.pl

question ==  
Calculer {{ A}} + {{P }}

==
 

#Variables prédéfinies de la question 
before ==

A = randint(1,5)*10
P = choice([1,5,4,6,5]) 
sol = A*P
==