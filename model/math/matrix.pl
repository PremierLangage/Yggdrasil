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
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval, Matrix
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==


jinja_keys = ["prefix", "question", "solution", "inputblock"]
before_scripts = ["mathimport", "initinput", "before", "process"]
eval_scripts = ["evalparam", "evaluator"]

title = Title

initinput ==
from matrixinput import MatrixInput
input = MatrixInput()
==

before ==

==

process ==
input.resizable = resizable
if resizable:
    input.set_zeros(*initsize)
else:
    input.set_zeros(sol.rows, sol.cols)
input.evalparam = {}
==


solution ==
<div style="display: block">
{{ prefix }} 
$! {{ sol|latex }} !$
</div>
==

evaluator ==
from matrixinput import MatrixInput
MatrixInput.message = message
input.sol = sol
input.eval()
score = input.score
input.display_feedback()
if score >= 0:
  input.disable()
==

tplpage =@ /model/tplpage/basicmath.html


inputblock ==
<div style="text-align:center">
{{ input|component }}
</div>
==


style.matrix ==
<style>
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
</style>
==

# API documentation

apidoc == #|json|
{
    "name": "matrix",
    "keys": {
        "sol": {
            "type": "Matrix",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Matrix."
        },
        "resizable": {
            "type": "bool",
            "default": "'False",
            "description": "Valeur indiquant si le champ de réponse est redimensionnable."
        },
        "initsize": {
            "type": "lst[int, int]",
            "default": "[2, 2]",
            "description": "Dimention initiale du champ de réponse. Cette clé n'est utile que si le champ de réponse est redimensionnable. Autrement, la dimension du champ de réponse matrice est automatiquement égale à la dimension de sol."
        }
    }
}
==