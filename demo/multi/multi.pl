extends = /model/basic/basic.pl
@ /utils/components/radio.py [radio.py]

before ==
from radio import Radio
radio1 = Radio()
radio2 = Radio()

items = [1, 2, 3, 4]

radio1.set_items(items)
radio1.set_sol(1)

radio2.set_items(items)
radio2.set_sol(1)
==

inputblock ==
{{ radio1|component }}

{{ radio2|component }}
==

evaluator ==
score = 0.5*radio1.eval() + 0.5*radio2.eval()
==
