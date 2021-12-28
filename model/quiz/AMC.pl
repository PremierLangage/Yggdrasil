extends = /model/quiz/basic.pl

@ /utils/format/AMC.py
@ /utils/components/scoring.py
@ /utils/components/radio.py
@ /utils/components/checkbox.py


start == #|python|
import random as rd
from radio import Radio
from checkbox import Checkbox
from AMC import parse_AMC_TXT
from exercises import ExRadio

_state_ = "active"

list_questions = parse_AMC_TXT(quiz)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

comp = []
questions  = []
inputblocks = []

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(Radio())
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
    elif q['type'] == "Checkbox":
        comp.append(Checkbox())
        comp[i].set_items(q['items'])
        comp[i].set_sol(q['index'])
    questions.append(q['text'])
    inputblocks.append(comp[i].render())
    if 'ordered' not in q['options']:
        comp[i].shuffle()

step = 0
score = -10
scores=[]
==

intro ==
Début du quiz
==



quiz ==
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

control ==
def eval_step(index):
    return comp[index-1].eval()

def disable_step(index):
    comp[index-1].disabled = True

def show_step(index):
    comp[index-1].show()
==
