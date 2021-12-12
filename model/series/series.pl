extends = /model/basic/temp.pl

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]
@ /utils/components/exercise/exercise.py

@ /utils/components/scoring.py
@ /utils/components/radio.py
@ /utils/components/checkbox.py
@ /utils/components/input.py

before_scripts = ["importfunc", "start", "before"]
eval_scripts = ["classexo", "evaluator"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

start ==
state = "active"
score = -1
scores = []

from input import Input
==

title =
form = 
text = 

tplpage =@ /model/quiz/template.html

style.basic =@ /model/basic/basic.css.html
style.series =@ /model/quiz/series.css.html

before == #|python|
state = "active"
step = 0
nbstep = 3
comp = []
questions = []
scores = []
==

intro ==
Début de la série
==


evaluator ==
for step in range(nbstep):
    scores.append(ex_eval(step))
    ex_disable(step)
    ex_show(step)

score = sum(scores) // len(scores)
state = "grade"
==
