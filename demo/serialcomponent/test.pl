@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input
inputs = [Input(), Input()]
==

text ==
{{ inputs[0]|component }}
{{ inputs[1]|component }}
==

form ==

==

evaluator ==
grade = (100, "")
==