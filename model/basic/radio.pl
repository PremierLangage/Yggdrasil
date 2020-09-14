extends = /model/basic.pl

radio =: RadioGroup
radio.decorator = CustomRadio

numsol = 0

before ==
if isinstance(choices, str):
    radio.setitems(choices.splitlines())
radio.setsol_from_index(int(numsol))
==

footerbefore ==
if isinstance(choices, str):
    radio.setitems(choices.splitlines())
radio.setsol_from_index(int(numsol))
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
