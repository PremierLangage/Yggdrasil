extends = /model/basic/basic.pl
@ /builder/before3.py [builder.py]
@ /grader/evaluator3.py [grader.py]
@ /utils/inputfields/inputfields.py

before == #|py|
from inputfields import Radio
sol = 3
obj = Radio()
obj.set_items(['AA', 'BB'])
ttt = obj.render()
==

evaluator ==
score = 0
==


question ==
Entrer 3
{{ ttt }}
==
