extends = /model/basic/basic.pl
@ /utils/components/radio.py [radio.py]

before ==
radio1 = RadioGroup()
radio2 = RadioGroup()

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
score = radio.eval()
==
