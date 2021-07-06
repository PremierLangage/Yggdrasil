#Modèle prédéfini 
extends = /model/basic/numeric.pl

question ==  
Calculer {{ A}} + {{P }}

==
 

#Variables prédéfinies de la question 
before ==

A = randint(1,5)*10
P = choice([1,5,4,6,5]) 
sol = A+P
==

evaluator ==

if ans != sol :
    score =0
    feedback = f"T es nul c'est {sol}"
else :
    score = 100
    feedback = "Bravo biloute"

==