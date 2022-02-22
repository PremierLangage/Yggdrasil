extends = /model/basic/hackpage.pl

@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /utils/builderlib2.py [builderlib.py]

@ /utils/plrandom.py
@ /utils/plcsv.py
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/graphics/plmpl.py

@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic2.py [json_encoder.py]

@ /utils/inputfields/radio.py
@ /utils/inputfields/checkbox.py
@ /utils/inputfields/textinput.py
@ /utils/inputfields/numinput.py
@ /utils/inputfields/dropgroup.py
@ /utils/inputfields/inputgroup.py
@ /utils/inputfields/scoring.py
@ /utils/inputfields/mathinput.py
@ /utils/components/mathinput/mathinput.py
@ /utils/components/mathinput/mathinput.html

@ /utils/steps/steps.py
@ /utils/steps/stepmath.py

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
