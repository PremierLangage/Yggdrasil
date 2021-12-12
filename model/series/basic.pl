extends = /model/basic/temp.pl

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

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
_state_ = "active"
==

title =

form = 

text = 

tplpage =@ /model/quiz/template.html

style.basic =@ /model/basic/basic.css.html
style.series =@ /model/quiz/series.css.html


intro ==
Début de la série
==


evaluator ==
if step == 0:
    step = 1

if step <= nbstep:
        qscore = ex_eval(step)
    if qscore != -1:
        ex_disable()
        ex_show()
        scores.append(qscore)
        step += 1

if step == nbstep + 1:
    _state_ = "grade"
==

