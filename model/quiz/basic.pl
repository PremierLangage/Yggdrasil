extends = /model/basic/temp2.pl

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]
@ /utils/components/dragdrop.py [customdragdrop.py]

@ /utils/components/scoring.py
@ /utils/inputfields/inputfields.py

before_scripts = ["importfunc", "init", "start"]
eval_scripts = ["control", "final"]

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

style.basic =@ /model/basic/basic.css.html
style.series =@ /model/quiz/series.css.html


intro ==
Début de la série
==


final ==
scores = []
for ex in sequence:
    scores.append(ex.eval())
    ex.disable()
    ex.display_feedback()

score = sum(scores) // len(scores)
_state_ = "grade"
==

