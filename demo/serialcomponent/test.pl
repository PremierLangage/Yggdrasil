@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input

input = Input(cid='toto')
_titi_ = Input(cid='titi',)
_tata_ = Input(cid='tata')
inpts = [Input(), Input()]
==

text ==
{{inpts}}
{{input}}
==

form ==
{{ input|component }}

==

evaluator ==
from random import randint
grade = (randint(0, 50), str(randint(0, 50)))
==