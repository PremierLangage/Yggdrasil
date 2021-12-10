extends = /model/basic/temp.pl

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/quiz/json_activity.py [json_encoder.py]
@ /utils/components/exercise/exercise.py
@ /utils/format/AMC.py
@ /utils/components/scoring.py
@ /utils/components/radio.py
@ /utils/components/checkbox.py

before_scripts = ["before"]
eval_scripts = ["evaluator"]

@ /Languages/Latin/phrases.txt

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ template2.html

style.basic =@ /demo/css/basic.html

before == #|python|
state = "active"
score = -1
scores = []

from components import Input

nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep)


sol = []
questions = []
comp = []

for i in range(nbstep):
    data = sample_lines[i].split("|")
    comp.append(Input())
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br> 

{ data[0].strip() }
"""
    questions.append(qq)
    sol.append(data[1].strip())

step = 0
==
