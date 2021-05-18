extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]

radio =: RadioGroup
radio.decorator = CustomRadio

indsol = 0
shuffled = True

before_scripts % ["importfunc", "before", "process"]

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

if isinstance(items, str):
    _items_ = items.splitlines()
else:
    _items_ = items

radio.setitems(_items_)

radio.setsol_from_index(indsol)

if shuffled:
    radio.shuffle()
==

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
radio.disabled = True
==