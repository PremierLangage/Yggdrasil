
@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Somme d'entiers

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
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
    ans=int(input.value)
    if ans==a+b:
        score=100
        feedback=""
    else:
        score=0
        feedback="La solution est %d." % sol
except:
    score=-1
    feedback="Votre réponse n'est pas un nombre entier."
==



