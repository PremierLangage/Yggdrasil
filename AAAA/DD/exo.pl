extends = /model/basic/numinput.pl
@ /builder/before3.py [builder.py]
@ /utils/inputfields/inputfields.py

before == #|py|
from inputfields import Radio
sol = 3
obj = Radio()
obj.set_items(['AA', 'BB'])
==

question ==
Entrer 3
{{obj|methinput}}
==
