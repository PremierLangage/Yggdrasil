@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = somme d'entiers

before==
import random as rd
a=rd.randint(10,20)
b=re.randint(10,20)
==

text==
Calculer {{a}}+{{b}}.
==

input=:Input
form==
{{input|component}}
==

evaluator==
try:
if int(input.value)==a+b:
    grade=(100,"")
else
    grade(0,"")
Except
    grade=(-1,"votre réponse n'est pas un nombre entier.")
==



