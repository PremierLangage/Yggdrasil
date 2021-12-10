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

before_scripts = ["before"]
eval_scripts = ["evaluator"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ template.html

style.basic =@ /model/basic/basic.css.html
style.series =@ /model/quiz/series.css.html

before == #|python|
state = "active"
step = 0

comp = []
questions = []
==

intro ==
Début de la série
==

evaluator ==
scores = []
for step in range(nbstep):
    #scores.append(lstex[step].eval(globals()))
    scores.append(comp[step].eval())
    comp[step].disable()
    comp[step].show()
score = sum(scores) // len(scores)
state = "grade"
==
