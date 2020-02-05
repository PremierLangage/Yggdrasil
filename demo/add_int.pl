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

myinput =: Input
myinput.type = number

form ==
{{ myinput | component }}
==

settings.feedback = lightscore

evaluator ==
if myinput.value==a+b:
    grade=(100,isinstance(myinput,Input))
else:
    grade=(0,f"La réponse est {a+b}.")
myinput.disabled = True
==





