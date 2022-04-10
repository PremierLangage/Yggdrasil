extends = /model/basic/numinput.pl
@ /builder/before3.py [builder.py]

before == #|py|
sol = 3
test = [NumInput(value=34), NumInput()]
==

question ==
Entrer 3
{{test[0]|component}}
==
