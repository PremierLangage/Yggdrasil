extends = /model/basic/multinput.pl
@ /utils/components/inputfields.py [numeric.py]

before ==
from input import Input
inputs = [Input() for _ in range(2)]
prefixes = ["", ""]
inputs[0]._sol = "0"
inputs[1]._sol = "10"
==

solution ==
Solution
==
