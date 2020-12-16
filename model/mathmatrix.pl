extends = math.pl

mat =: MathMatrix
mat.decorator = CustomMathMatrix
mat.resizable % true


form==
<div style="text-align:center">
{{ mat|component }}
</div>
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
score, feedback = eval_matrix(mat.getmatrix(), sol)
==

message.Solution ==
La solution est $$\left( {{ sol|latex }} \right).$$
==