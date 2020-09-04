




title = Addition

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
Calculer le nombre de secondes dans une année non bissextile. 

Saisissez soit le nombre exacte soit une expression permettant de le calculer.
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

settings.feedback = rightwrong

evaluator ==
try:
    if int(input.value) == 31536000 :
        grade=(100," exact ")
except :
    try :
       if eval(input.value) == 31536000 :
            grade=(100,"expression correcte")
    except :
        grade=(0,f"La réponse est 31536000.")

==



