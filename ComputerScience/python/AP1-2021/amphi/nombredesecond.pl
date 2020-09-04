

# DR 25/09/2019 OK
#  Author: DR
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py] 
@ /builder/before.py [builder.py] 




title = Expression

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
Calculer le nombre de secondes dans une année **non bissextile** (365 Jours). 

Saisissez soit le nombre exacte soit une expression permettant de le calculer.
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
if len(input.value) == 0 :
    grade = (0, " essayez encore quelque chose de plus grand.")
else:
    try:
        if int(input.value) == 31536000 :
            grade=(50,"C'est exact !")
        else:
            grade=(0,"Valeur incorrecte")

    except :
        try :
            if eval(input.value) == 31536000 :
                grade=(100,"expression correcte égale à 31536000")
        except :
            grade=(0,"La réponse est 31536000.")
==



