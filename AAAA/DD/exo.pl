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
<div style="display: block; margin-top: 1em;">
{{ prefix }}
{{ mathinput|component}}
</div>
==

evaluator==
grade = (100, mathinput.value);
==
