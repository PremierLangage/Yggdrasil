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
        grade=(100,"Bravo")
    else:
        grade=(0,"Raté")
    exec(before)
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==


