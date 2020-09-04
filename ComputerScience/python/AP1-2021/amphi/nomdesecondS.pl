


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
Une année **Sidérale** dure en moyenne : 365,256 363 051 jours.

Soit 365 j 6 h 9 min 9 secondes et des poussières. 

Calculer le nombre de secondes dans une année **Sidérale**. 

Saisissez soit le nombre exacte soit une expression permettant de le calculer.
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
nbs=31558149

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
            if eval(input.value) == 31558149 :
                grade=(100,"expression correcte égale à "+str(nbs))
            else:   
                grade=(0,"expression syntaxiquement correcte mais fausse")
        except :
            grade=(0,"Expression syntaxiquement incorrecte ")
==



