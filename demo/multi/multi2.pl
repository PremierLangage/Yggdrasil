extends = /model/basic/multinput.pl


before ==
from inputfields import Input, MultInputField
doubleinput = MultInputField()
doubleinput.inputs = [Input() for _ in range(2)]
prefixes = ["", ""]
doubleinput.inputs[0].sol = "0"
doubleinput.inputs[1].sol = "10"
==

inputblock ==
{{ doubleinput.inputs[0]|component }}
{{ doubleinput.inputs[1]|component }}
==

solution ==
Solution
==

evaluator ==
doubleinput.eval()
==
