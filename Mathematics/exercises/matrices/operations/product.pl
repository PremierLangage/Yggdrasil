extends = /model/math.pl

matrix =: MathMatrix
matrix.decorator = CustomMathMatrix
matrix.resizable % true


before==
M = Matrix([[1,2],[4,5]])
matrix.setmatrix(M)
==

title==
Math Matrix Component
==

text==
==

form==
{{ matrix|component}}
==
