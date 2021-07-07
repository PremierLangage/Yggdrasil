title = "Addition pour les nuls"

#Modèle prédéfini (hérite du modèle numeric)
extends = /model/basic/numeric.pl

question ==  
Calculer {{A}} + {{P}}

==
 

#Variables prédéfinies de la question 
before ==

A = randint(1,5)*10
P = choice([1,5,4,6,5]) 
sol = A+P
==

#f pour mettre une variable dans le résultat. ans est la réponse
evaluator ==

if not isinstance(ans,int):
    score =-1
    feedback = "Apprend ton cours la réponse est un entier"

if ans != sol :
    score =0
    feedback = f"T es nul c'est {sol}"
else :
    score = 100
    feedback = "Bravo biloute"

==