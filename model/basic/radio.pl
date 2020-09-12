extends = /model/basic.pl

radio =: RadioGroup
radio.decorator = CustomRadio

numsol = 0

before ==
if isinstance(choices, string):
    radio.setitems(choices.splitlines())
radio.setsol_from_index(numsol)
==


form ==
{{ radio|component }}
==

evaluator ==
grade = radio.eval()
radio.disabled = True
==

