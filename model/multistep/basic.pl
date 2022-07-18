extends = /model/basic/hackpage.pl

@ /utils/plrandom.py
@ /utils/plcsv.py
@ /utils/sympy/sympy2latex.py

@ /builder/before3.py [builder.py]
@ /grader/evaluator3.py [grader.py]
@ /utils/inputfields/basicinput.py
@ /utils/steps/steps.py
@ /model/math/jinja_math.py [jinja_env.py]
@ /utils/json/basicjson.py [json_encoder.py]
@ /utils/json/serializable.py


before_scripts = ["importfunc", "init", "before", "process"]

jinja_keys = ["intro", "inputblock0"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

before == #|python|
sequence = [StepTextInput(), StepRadio()]
sequence[0].question = "Quelle est la capitale de la France ?"
sequence[0].input.sol = "Paris"
sequence[0].solution = "Paris"

sequence[1].question = "Quelle est la superficie de la France ?"
sequence[1].set_items(["150 000 km²", "550 000 km²", "1 000 000 km²"])
sequence[1].set_sol(1)
==

init ==
_state_ = "active"
from steps import StepTextInput, StepRadio
==

process ==

istep = 0
nbsteps = len(sequence)
score = -1
scores = []
==

title =

form = 

text = 

tplpage =@ /model/tplpage/multistep.html

style.basic =@ /model/css/basic.css.html



intro ==
Début de la série
==


evaluator ==
scorestep = sequence[istep].eval()
sequence[istep].display_feedback()

if scorestep >= 0:
    scores.append(scorestep)
    sequence[istep].disable()
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = int(sum(scores)/len(scores))
==