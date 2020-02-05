@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Addition


before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input
input.type = number

form ==
{{ input | component }}
==

settings.feedback = lightscore

evaluator ==
if input.value==a+b:
    grade=(100,str(locals()))
else:
    grade=(0,f"La réponse est {a+b}.")
input.disabled = True
==





