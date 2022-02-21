extends = /model/basic/hackpage.pl

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib2.py [builderlib.py]
@ /utils/steps/steps.py

@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic2.py [json_encoder.py]

@ /utils/inputfields/radio.py
@ /utils/inputfields/checkbox.py
@ /utils/inputfields/textinput.py
@ /utils/inputfields/numinput.py
@ /utils/inputfields/dropgroup.py
@ /utils/inputfields/inputgroup.py
@ /utils/inputfields/scoring.py

before_scripts = ["importfunc", "init", "start"]

jinja_keys = ["intro","inputblock0"]


importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

init ==
_state_ = "active"
==

title =

form = 

text = 

tplpage =@ /model/quiz/template.html

style.basic =@ /model/basic/basic2.css.html
style.series =@ /model/quiz/series.css.html


intro ==
Début de la série
==


evaluator ==
step = steps[istep]
exec(eval[step])
if scorestep >= 0:
    scores.append(scorestep)
    istep += 1

if istep >= nbsteps:
    istep = nbsteps-1
    state = "final"
    score = sum(scores)/len(scores)

==