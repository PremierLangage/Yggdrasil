@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/sandboxio.py

title =

keylist % [1, 2]

before ==
from components import Input
input1 = Input()
input2 = Input()
==

text ==
{{ input1|component }}
{{ input2|component }}
==

form ==

==
