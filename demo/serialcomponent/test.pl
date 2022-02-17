@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input
inputs = {'a': Input(), 'b':Input()}
input = Input()
==

text ==
{{inputs}}
{{input}}
==

form ==
{{ input|component }}

{{ inputs.a|component }}
{{ inputs.b|component }}
==

evaluator ==
grade = (100, "")
==