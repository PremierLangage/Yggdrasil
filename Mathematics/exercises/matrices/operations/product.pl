extends = /model/math.pl

matrix =: MathMatrix
matrix.decorator = CustomMathMatrix
matrix.resizable % true


before==
matrix.matrix = [
    [{ "value": 0, }, { "value": 0 },],
    [{ "value": 0 }, { "value": 0, },]
]
==

title==
Math Matrix Component
==

text==
==

form==
{{ matrix|component}}
==
