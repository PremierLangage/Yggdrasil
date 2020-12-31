@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

before ==
==

title = PLaTOn hello world

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
    grade = (100,"Bravo (mais c'était pas dur)")
    feedback ="Attention c'était facile"
else:
    grade = (0,"Bon il faut réessayer")
    feedback = "Concentrez-vous !"
==
