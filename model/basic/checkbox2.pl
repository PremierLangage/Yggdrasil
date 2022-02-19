extends = /model/basic/basic2.pl

# Data

question ==
Quelle est la réponse ?
==

items ==
Item 1
Item 2
Item 3
==

indsol = [0, 1]

shuffled = True

# 

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