@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input

input = Input(value='5')
input0 = Input(value='7')
inputs = [{cid: input0.cid, selector:input0.selector}]
==

text ==
{{inpts}}
{{input}}
{{tata}}
==

form ==
{{ input|component }}
{{ inputs[0]|component }}
==

evaluator ==
from random import randint
grade = (randint(0, 50), str(randint(0, 50)))
==