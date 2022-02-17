@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input

input = Input(cid='toto')
inpts = [Input(value='4'), Input()]
tata = inpts[0]
==

text ==
{{inpts}}
{{input}}
{{tata}}
==

form ==
{{ input|component }}

==

evaluator ==
from random import randint
grade = (randint(0, 50), str(randint(0, 50)))
==