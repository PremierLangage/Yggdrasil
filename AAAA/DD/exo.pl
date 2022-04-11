extends = /model/basic/basic.pl
@ /builder/before3.py [builder.py]
@ /grader/evaluator3.py [grader.py]
@ /utils/inputfields/inputfields.py

before == #|py|
from inputfields import Radio, Checkbox
sol = 3
obj = Checkbox()
obj.set_items(['AA', 'BB', 'CC'])
ttt = obj.render()
==

evaluator ==
score = 0
#obj.set_items(['AA', 'BB', 'CC', 'DD'])

==


question ==
Entrer 3
{{ ttt }}
==
