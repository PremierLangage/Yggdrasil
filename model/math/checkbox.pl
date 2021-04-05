extends = /model/math/math.pl

@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffle % true

footerbefore ==
checkbox.setitems(choices)
checkbox.setsol_from_index(indsol)

if shuffle:
    checkbox.shuffle()
==


settings.feedback = lightscore

form ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==
