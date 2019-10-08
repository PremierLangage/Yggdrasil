@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Démo MathInput

before =

text ==
Entrer une expression mathématique puis valider pour voir la chaîne LateX récupérée par le composant.
==

input =: MathInput

form ==
{{ input | component }}
==

evaluator ==
grade=(100,input.value)
==


