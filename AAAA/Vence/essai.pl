@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

before ==
import random as rd
a = rd.randint(10, 20)
b = rd.randint(10, 20)
==

title = "Addition"

text ==
Calculer {{ a }} + {{ b }}.
==

input =: Input
input.type = number

form ==
{{ input|component }}
==

evaluator ==
if input.value == a + b:
    score = 100
else:
    score = 0
==
