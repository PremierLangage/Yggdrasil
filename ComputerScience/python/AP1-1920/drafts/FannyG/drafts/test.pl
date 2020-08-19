


extends = /model/basic.pl

radio =: RadioGroup

before ==
choices = []
radio.items = []
radio.setitems(['ok','ol','om'])
radio.setsol_from_index(0)
radio.shuffle()
==

title ==
Radio groupe
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




