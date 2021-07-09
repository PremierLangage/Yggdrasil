extends = /model/basic/basic.pl
@ /utils/components/inputfields.py [inputfields.py]

before ==
from inputfields import Radio
radio1 = Radio()
radio2 = Radio()

items = [1, 2, 3, 4]

radio1.set_items(items)
radio2.set_items(items)
radio1.set_sol(0)
radio2.set_sol(10)
==

inputblock ==
{{ radio1.score }}
<div class="row">
  <div class="col-sm-6">{{ radio1|component }}</div>
  <div class="col-sm-6">{{ radio2|component }}</div>
</div>
==

evaluator ==
score = 0
==

solution ==
{{ radio1 }}
==
