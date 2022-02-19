extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [checkbox.py]


initinput ==
from inputfields import Checkbox
checkbox = Checkbox()
==

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

checkbox.set_items(items)
checkbox.set_sol(indsol)
if shuffled:
    checkbox.shuffle()

ex.question = question
ex.inputblock = inputblock
==

inputblock ==
{{ checkbox|component }}
==

shuffled = True

evaluator ==
score = checkbox.eval()
==
