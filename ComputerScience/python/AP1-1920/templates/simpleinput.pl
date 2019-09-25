@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py] 
@ /builder/before.py [builder.py] 

component =: Input
component.type = number

before==
==

title==
Input Component
==

text==
==

form==
{{ component|component}}
==

evaluator==
grade = (100, component.value)
==

