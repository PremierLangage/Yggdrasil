extends = /model/basic.pl

radio =: RadioGroup
radio.decorator = CustomRadio

numsol % 0


footerbefore ==
if isinstance(choices, str):
    radio.setitems(choices.splitlines())
else:
    radio.setitems(choices)

radio.setsol_from_index(numsol)

if shuffle:
    radio.shuffle()
==


form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
radio.disabled = True
==

shuffle % true

