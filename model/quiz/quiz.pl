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

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ template.html

style.basic =@ /demo/css/basic.html

before == #|python|
import random as rd
from radio import Radio
from checkbox import Checkbox
from AMC import parse_AMC_TXT
from exercise import Ex

state = "active"

list_questions = parse_AMC_TXT(questions)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

comp = []
statement  = []
lstex =[]

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(Radio())
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
    elif q['type'] == "Checkbox":
        comp.append(Checkbox())
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
    elif  q['type'] == 'TextSelect':
        # comp.append(CustomTextSelect())
        continue # no implemented yet 
    statement.append(q['text'])
    if 'ordered' not in q['options']:
        comp[i].shuffle()
    ex = Ex()
    ex.question = q['text']
    ex.evaluator = "score = comp[i].eval()"
    lstex.append(ex)

    
==

intro ==
{{ lstex }}
==

evaluator ==
scores = []
for step in range(nbstep):
    scores.append(lstex[step].eval(globals()))
    #scores.append(comp[step].eval())
    comp[step].disable()
    comp[step].show()
score = sum(scores) // len(scores)
state = "grade"
==

questions ==
* Quelle est la capitale du Cameroun ?
+ Yaoundé
- Douala
- Kribi

** Parmi les nombres suivants, lesquels sont positifs ?
+ 2
- -2
+ 10

*[ordered] Combien font un plus un ?
- 0
- 1
+ 2
- 3
==