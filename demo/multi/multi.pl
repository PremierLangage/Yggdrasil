extends = /model/basic/basic.pl
@ /utils/components/inputfields.py [numeric.py]

before ==
from numeric import Numeric
numeric1 = Numeric()
numeric2 = Numeric()

numeric1._sol = 0
numeric2._sol = 10
==

inputblock ==
<div class="row">
  <div class="col-sm-6">{{ numeric1|component }}</div>
  <div class="col-sm-6">{{ numeric2|component }}</div>
</div>
==

evaluator ==
numeric1.eval()
numeric1.show()
numeric2.eval()
numeric2.show()
score = 50
==

solution ==
{{ numeric1 }}
==
