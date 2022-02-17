@ /builder/before.py [builder.py]
@ /grader/evaluator_serial.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input

input = Input(cid='toto',  debug=True, value='1')
_titi_ = Input(cid='titi', debug=True, value='1')
_tata_ = Input(cid='tata', debug=True, value='1')
inpts = [_titi_, _tata_]
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
grade = (randint(0, 50), str(randint(0, 50)))
==