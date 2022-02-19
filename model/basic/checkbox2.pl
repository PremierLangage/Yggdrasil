extends = /model/basic/basic2.pl

initinput ==
from exercises import ExCheckbox
ex = ExCheckbox()
==

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

ex.set_items(items)
ex.set_sol(indsol)
if shuffled:
    ex.input.shuffle()

ex.question = question
ex.inputblock = inputblock
==

inputblock ==
{{ ex.input|component }}
==

shuffled = True

evaluator ==
score = checkbox.eval()
==
