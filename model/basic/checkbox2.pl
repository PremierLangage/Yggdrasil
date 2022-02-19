extends = /model/basic/basic2.pl

initinput ==
from inputfields import Checkbox
input = Checkbox()
==

process ==
input.set_items(items)
input.set_sol(indsol)
if shuffled:
    input.shuffle()
==

inputblock ==
{{ input|component }}
==

shuffled = True

evaluator ==
score = input.eval()
==
