@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
input.value=None
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"Bravo "+str(a)+"+"+str(b)+"="+str(a+b)+"<br>\n **Ok d'accord c'est pas terrible comme exercice mais c'est pour la démo :)**")
    else:
        grade=(0,"Raté "+str(a)+"+"+str(b)+"="+str(a+b))
    exec(before)
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==



