extends = /model/basic/basic2.pl

# Data

question ==
Quelle est la réponse ?
==

items ==
Item 0
Item 1
Item 2
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
input.display_feedback()
input.disable()
==