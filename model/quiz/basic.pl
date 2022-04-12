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

tplpage =@ /model/tplpage/quiz.html

style.basic =@ /model/css/basic.css.html
style.series =@ series.css.html


intro ==
Début de la série
==


final ==
scores = []
for step in sequence:
    scores.append(step.eval())
    step.disable()
    step.display_feedback()

score = sum(scores) // len(scores)
_state_ = "grade"
==

