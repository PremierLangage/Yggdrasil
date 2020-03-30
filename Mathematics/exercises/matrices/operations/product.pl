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

evaluator ==
score = 100
feedback = str(Matrix(matrix.getmatrix()))
==

extracss ==
<style>
.matrix-input {
    border : none;
    border-radius:2px !important;
    text-align: center;
    font-style: normal !important;
    font-size: 12pt;
    color:black;
    background-color: transparent !important;
    z-index:10;
}
</style>
==
