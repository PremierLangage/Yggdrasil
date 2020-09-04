


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
Calculer le nombre de secondes dans une année  **bissextile**. 

Saisissez soit le nombre exacte soit une expression permettant de le calculer.
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
nbs=31622400
if len(input.value) == 0 :
    grade = (0, " essayez encore quelque chose de plus grand.")
else:
    try:
        if int(input.value) == nbs :
            grade=(50,"C'est exact ! mais privilégiez une expression python.")
        else:
            grade=(0,"Valeur incorrecte")

    except :
        try :
            if eval(input.value) == nbs :
                grade=(100,"Expression correcte égale à "+str(nbs))
            else:   
                grade=(0,"Expression syntaxiquement correcte mais fausse")
        except :
            grade=(0,"Expression syntaxiquement incorrecte ")

==




