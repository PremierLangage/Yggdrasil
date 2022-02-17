@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input

input = Input(value='5')
inp = Input(value='7')
inpts = [inp.copy(), Input()]
tata = inpts[0]
==

text ==
{{inpts}}
{{input}}
{{tata}}
==

form ==
{{ input|component }}
{{ inpts[0]|component }}
==

evaluator ==
from random import randint
grade = (randint(0, 50), str(randint(0, 50)))
==