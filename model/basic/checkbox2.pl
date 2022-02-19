extends = /model/basic/basic2.pl

initinput ==
from exercises import ExCheckbox
ex = ExCheckbox()
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
