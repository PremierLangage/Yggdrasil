extends = /model/basic/hackpage.pl

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib2.py [builderlib.py]

@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic2.py [json_encoder.py]

@ /utils/inputfields/radio.py
@ /utils/inputfields/checkbox.py
@ /utils/inputfields/textinput.py
@ /utils/inputfields/numinput.py
@ /utils/inputfields/dropgroup.py
@ /utils/inputfields/inputgroup.py
@ /utils/inputfields/scoring.py

@ /utils/steps/steps.py

@ /utils/plrandom.py
@ /utils/plcsv.py

before_scripts = ["importfunc", "init", "before", "process"]

jinja_keys = ["intro", "inputblock0"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

before == #|python|
sequence = [StepTextInput(), StepTextInput()]
sequence[0].question = "Quelle est la capitale de la France ?"
sequence[0].input.sol = "Paris"
sequence[0].solution = "Paris"

sequence[1].question = "Quelle est la capitale de l'Italie ?"
sequence[1].input.sol = "Rome"
sequence[1].solution = "Paris"
==

init ==
_state_ = "active"
from steps import StepTextInput
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

tplpage =@ /model/multistep/template2.html

style.basic =@ /model/basic/basic2.css.html
style.series =@ /model/quiz/series.css.html


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