@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

mathinput =: MathInput

before==
==

title==
Math Input Component
==

text==
==

prefix = Réponse :

form==
{{ mathinput|component}}
==

evaluator==
grade = (100, mathinput.value);
==
