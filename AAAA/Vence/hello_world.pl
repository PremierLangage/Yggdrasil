@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

before ==
==

title = "Addition"

text ==
Calculer 1+2.
==

input =: Input
input.type = number

form ==
{{ input|component }}
==

evaluator ==
if input.value == 3:
    score = 100
else:
    score = 0
==
