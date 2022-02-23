extends = /model/basic/utils.pl
extends = /model/basic/hackpage.pl
extends = messages_math.pl
extends = aux_mathinput.pl

text =

form = 

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

jinja_keys = ["intro","inputblock0"]
before_scripts = ["mathimport", "stepimport", "before", "process"]

stepimport ==
from steps import StepRadio
from stepmath import StepMath
==

before == #|python|
sequence = [StepMath(), StepMath()]
sequence[0].question = "toto"
sequence[0].input.sol = sqrt(3)
sequence[0].solution = "solution"
sequence[0].set_inputblock(inputblock0, globals())

sequence[1].question = "toto"
sequence[1].input.sol = sqrt(3)
sequence[1].solution = "solution"
sequence[1].inputblock = sequence[1].input.render()

# Créer champs de réponse
#inputblock = input.render()
istep = 0
nbsteps = len(sequence)
score = -1
scores = []
==

process ==

istep = 0
nbsteps = len(sequence)
score = -1
scores = []
==

inputblock0 ==
toto : {{ sequence[0].input|mathinput }}
==


evaluator ==
from stepmath import StepMath

for step in sequence:
    if isinstance(step, StepMath):
        step.input.value = answers.get(step.input.id, '')

scorestep = sequence[istep].input.eval()
sequence[istep].input.display_feedback()
if isinstance(sequence[istep], StepMath):
    sequence[istep].update(globals())

if scorestep >= 0:
    scores.append(scorestep)
    scorestep = sequence[istep].input.disable()
    if isinstance(sequence[istep], StepMath):
        sequence[istep].update(globals())
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)



==

tplpage =@ /model/multistep/template2.html
style.basic =@ /model/css/basic.css.html