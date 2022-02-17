@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

before ==
from components import Input

input = Input(value='5')
input0 = Input()
inputs = [[{'cid': input0.cid, 'selector':input0.selector, 'value':'8'}]]
==

text ==
{{inpts}}
{{input}}
{{tata}}
==

form ==
{{ input|component }}
{{ inputs[0][0]|component }}
==

evaluator ==
from random import randint
grade = (randint(0, 50), str(randint(0, 50)))
==