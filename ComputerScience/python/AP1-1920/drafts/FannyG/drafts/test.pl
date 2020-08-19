
#https://documentationpl.readthedocs.io/fr/latest/radio/


extends = /model/basic.pl

radio =: RadioGroup

before ==
radio.setitems(['ok','ol','om'])
radio.setsol_from_index(0)
radio.shuffle()
==

title ==
RadioGroup
==

text ==
Quelle est la capitale ?
==

form ==
{{ radio|component }}
=

evaluator ==
score = radio.eval()
==




