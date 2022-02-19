extends = /model/basic/basic2.pl

initinput ==
from exercises import ExCheckbox
ex = ExCheckbox()
==

process ==
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
score = ex.eval()
==
