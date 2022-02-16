extends = /model/math/multinput.pl
@ /utils/components/inputfields.py [numeric.py]

before ==
from numeric import Numeric
inputs = [Numeric() for _ in range(2)]
prefixes = ["", ""]
inputs[0]._sol = 0
inputs[1]._sol = 10
==

