@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Addition

before ==
import random as rd
a=rd.randint(100,200)
b=rd.randint(10,20)
==

text ==
Calculer {{a}} + {{b}}.
==

input =: Input

form ==
{{ input | component }}
==


evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"Super")
    else:
        grade=(0,"%d + %d = %d" % (a,b,a+b))
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==

