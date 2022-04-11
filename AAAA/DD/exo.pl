extends = /model/basic/numinput.pl
@ /builder/before3.py [builder.py]
@ /utils/inputfields/inputfields.py

before == #|py|
from inputfields import Radio
sol = 3
test = [NumInput(value=34), NumInput()]
==

question ==
Entrer 3
{{test[0]|component}}
==
