extends = /model/basic/temp2.pl

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib2.py [builderlib.py]
@ /utils/components/multicomp.py
@ /utils/components/dragdrop.py [customdragdrop.py]
@ /utils/exercises/exercises.py

@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

@ /utils/inputfields/radio.py
@ /utils/inputfields/checkbox.py
@ /utils/inputfields/textinput.py
@ /utils/inputfields/numinput.py
@ /utils/inputfields/dragdrop.py
@ /utils/inputfields/multinput.py
@ /utils/inputfields/scoring.py

before_scripts = ["importfunc", "initinput", "before", "process"]
eval_scripts = ["getans", "evaluator", "evalprocess"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ template2.html

style.basic =@ basic2.css.html
