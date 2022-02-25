extends = /model/basic/utils.pl
extends = /model/basic/hackpage.pl
extends = messages_math.pl
extends = aux_mathinput.pl

text =
form = 
latexsettings.ln_notation = True
latexsettings.inv_trig_style = full
input_type = "expr"

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

style.basic =@ /model/css/basic.css.html

jinja_keys = ["prefix", "question", "solution", "inputblock"]
before_scripts = ["mathimport", "init_input", "before", "process"]
eval_scripts = ["evalparam", "evaluator"]

prefix = Réponse :
keypad = []
embed =

title = Title

init_input ==
from mathinput import MathInput
input = MathInput()
input.set_keypad(keypad)
input.value = ""
input.type = input_type
# embed = embed.replace("#", r"\MathQuillMathField{}")
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
from mathinput import MathInput
MathInput.message = message

input.value = answers[input.id]
input.sol = sol
input.eval()
score = input.score
input.display_feedback()
if score >= 0:
  input.disable()
==

tplpage =@ /model/tplpage/basic.html


inputblock ==
<div style="display: block; margin-top: 1em;">
{{ prefix }}
{{ input|mathinput }}
</div>
==