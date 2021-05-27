extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [customcheckbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled = True

before_scripts % ["importfunc", "before", "process"]

importfunc ==
from random import randint, choice, choices, sample, shuffle
==

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

checkbox.setitems(items)
checkbox.setindsol(indsol)
if shuffled:
    checkbox.shuffle()
==

settings.feedback = lightscore

inputblock ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==