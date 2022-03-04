extends = /model/basic/utils.pl
extends = /model/basic/hackpage.pl
extends = messages_math.pl

# Specific keys

resizable = True

initsize = [2, 2]

prefix = Réponse :

latexsettings.ln_notation = True
latexsettings.inv_trig_style = full

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==
jinja_keys = ["prefix", "question", "solution", "inputblock"]
before_scripts = ["mathimport", "init_input", "before", "process"]
eval_scripts = ["evalparam", "evaluator"]



title = Title

init_input ==
from matrixinput import MatrixInput
input = MatrixInput()
input.resizable = resizable
if resizable:
    input.set_zeros(*initsize)
else:
    input.set_zeros(sol.rows, sol.cols)
==

before ==
sol = 0
==

solution ==
<div style="display: block">
{{ prefix }} 
$! {{ sol|latex }} !$
</div>
==

evalparam ==

==

evaluator ==
input.eval()
score = input.score
input.display_feedback()
if score >= 0:
  input.disable()
==

tplpage =@ /model/tplpage/basicmath.html


inputblock ==
{{ input|component }}
==


before_scripts % ["importmath", "before", "initmat"]

initmat ==
mat.resizable = resizable
if resizable:
    mat.setzeros(*initsize)
else:
    mat.setzeros(sol.rows, sol.cols)
==


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

extends = messages_math.pl

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
