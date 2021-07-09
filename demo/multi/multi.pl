extends = /model/basic/basic.pl
@ /utils/components/inputfields.py [inputfields.py]

before ==
from inputfields import Numeric
numeric1 = Numeric()
numeric2 = Numeric()

items = [1, 2, 3, 4]

numeric1.set_items(items)
numeric1.set_sol(1)

numeric2.set_items(items)
numeric2.set_sol(1)
==

inputblock ==
<div class="row">
  <div class="col-sm-6">{{ numeric1|component }}</div>
  <div class="col-sm-6">{{ numeric2|component }}</div>
</div>
==

evaluator ==
score = 0.5*numeric1.eval() + 0.5*numeric2.eval()
==
