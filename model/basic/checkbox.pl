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

if isinstance(items, str):
    _items_ = items.splitlines()
elif isinstance(items, list):
    _items_= items
else:
    raise TypeError("items must be a string or a list")

checkbox.setitems(_items_)
checkbox.setsol_from_index(indsol)

if shuffled:
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