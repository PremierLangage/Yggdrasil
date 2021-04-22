extends = /model/math/math.pl

mat =: MathMatrix
mat.decorator = CustomMathMatrix
mat.resizable % true


form2 ==
<div style="text-align:center">
{{ mat|component }}
</div>
==

form ==
{{ mat|component }}
==

settings.feedback = rightwrong

settings.maxattempt % 1

style.matrix ==
.matrix-input {
    border : none;
    border-radius: 4px;
    text-align: center;
    font-style: normal !important;
    font-size: 12pt;
    color:black;
    background-color: transparent !important;
    z-index:10;
}
==


evaluator ==
from evalsympy import eval_matrix
score, error = eval_matrix(mat.getmatrix(), sol)
feedback = message[error]
==

solution ==
La solution est $$\left( {{ sol|latex }} \right).$$
==
