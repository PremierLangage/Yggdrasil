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
{{ input|component }}
{{ inputs[0]|component|safe }}
{{ inputs[1]|component|safe }}
==

form ==

==

evaluator ==
grade = (100, "")
==