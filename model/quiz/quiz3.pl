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

tplpage =@ template2.html

style.basic =@ /demo/css/basic.html

before == #|python|
import random as rd
from radio import Radio
from checkbox import Checkbox
from AMC import parse_AMC_TXT
from exercise import Ex

state = "active"

from components import Input

nbstep = 4

with open('phrases.txt') as file:
    all_lines = [line for line in file.readlines() if line.strip()]

sample_lines = rd.sample(all_lines, nbstep)

sol = []
questions = []
comp = []

for i in range(nbstep):
    data = sample_lines[i].split("|")
    comp.append(Input())
    questions.append(data[0].strip())
    sol.append(data[1].strip())

step = 0
score = -10
scores=[]
==

intro ==
Début du quiz
==

evaluator ==
class Exo:

    def __init__(self, step):
        self.step = step

    def eval(self):
        return comp[self.step-1].eval()

    def disable(self):
        comp[self.step-1].disable()

    def show(self):
        comp[self.step-1].show()

if step == 0:
    step = 1

if step <= nbstep:
    ex = Exo(step)
    qscore = ex.eval()
    if qscore != -1:
        ex.disable()
        ex.show()
        scores.append(qscore)
        step += 1

if step == nbstep + 1:
    state = "grade"
==

