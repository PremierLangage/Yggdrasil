@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input
inpts = [Input(), Input()]
input = Input()
==

text ==
{{inpts}}
{{input}}
==

form ==
{{ input|component }}

{{ inpts[0]|component }}
{{ inpts[1]|component }}
==

evaluator ==
from random import randint
grade = (randint(0, 50), "")
==