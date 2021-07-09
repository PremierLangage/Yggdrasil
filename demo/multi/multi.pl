extends = /model/basic/basic.pl
@ /utils/components/inputfields.py [inputfields.py]

before ==
from inputfields import Numeric
numeric1 = Numeric()
numeric2 = Numeric()
numeric1.debug = True
items = [1, 2, 3, 4]

numeric1._sol = 0
numeric2._sol = 10
numeric1.score = 100
==

inputblock ==
{{ numeric1.score }}
<div class="row">
  <div class="col-sm-6">{{ numeric1|component }}</div>
  <div class="col-sm-6">{{ numeric2|component }}</div>
</div>
==

evaluator ==
score = 0
==

solution ==
{{ numeric1 }}
==
