extends = /model/basic/inputgroup.pl

before ==
inputs = [TextInput(), TextInput()]
inputs[0].sol = "Paris"
inputs[1].sol = "Rome"
==

inputblock ==
France : {{ inputs[0]|component }}
Italie : {{ inputs[1]|component }}
==

question ==
Quelle est la capitale des pays suivants ?
==
