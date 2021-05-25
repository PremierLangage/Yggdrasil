#! indsol:int
indsol = 0

items =


#! shuffled:bool
shuffled = True

#! items:str

extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/radio.py [customradio.py]

radio =: RadioGroup
radio.decorator = CustomRadio

before_scripts % ["importfunc", "before", "process"]

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

radio.setitems(items)
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