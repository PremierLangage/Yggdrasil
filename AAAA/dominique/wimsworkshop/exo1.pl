
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

lasaisie =: Input
lasaisie.type = text
lasaisie.placeholder = Answer
lasaisie.maxlength = 2
lasaisie.appearance = outline

before=

title= Votre exerciseur !

text==
Veuillez choisir votre exerciseur.
==

form==
{{ lasaisie|component}}
==

evaluator==
if "wims" == lasaisie.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==


