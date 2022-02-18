extends = /model/basic/multinput.pl


before ==
from inputfields import Input
inputs = [Input() for _ in range(2)]
prefixes = ["", ""]
inputs[0].sol = "0"
inputs[1].sol = "10"
==

solution ==
Solution
==
