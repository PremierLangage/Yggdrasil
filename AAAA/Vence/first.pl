@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Addition

text==
Donner le produit de 2 et 4

==
input =: Input
input.type = number

form ==
{{ input|component }}
==

evaluator==
    if input.value == 8:
        score = 100
    else:
        score = 0
==