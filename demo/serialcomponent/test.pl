@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input
inputs = [Input(), Input()]
input = Input()
==

text ==

==

form ==
{{ inputs[0]|component }}
{{ input|component }}

{{ inputs[1]|component }}
==

evaluator ==
grade = (100, "")
==