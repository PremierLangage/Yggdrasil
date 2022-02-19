extends = /model/basic/basic2.pl

# Data

shuffled = True

inputblock ==
{{ input|component }}
==

# Scripts

initinput == #|py|
from inputfields import Checkbox
input = Checkbox()
==

process == #|py|
input.set_items(items)
input.set_sol(indsol)
if shuffled:
    input.shuffle()
==

evaluator == #|py|
score = input.eval()
input.disable()
==
