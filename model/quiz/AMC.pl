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
sequence = []
for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        sequence.append(ExRadio())
        sequence[i].set_items(q['items'])
        sequence[i].set_sol(q['index'])
    elif q['type'] == "Checkbox":
        sequence.append(ExCheckbox())
        sequence[i].set_items(q['items'])
        sequence[i].set_sol(q['index'])
    questions.append(q['text'])
    inputblocks.append(comp[i].render())
    if 'ordered' not in q['options']:
        sequence[i].input.shuffle()

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

*[ordered] Combien font un plus un ?
- 0
- 1
+ 2
- 3
==

old ==
** Parmi les nombres suivants, lesquels sont positifs ?
+ 2
- -2
+ 10
==

control ==
def eval_step(index):
    return comp[index-1].eval()

def disable_step(index):
    comp[index-1].disabled = True

def show_step(index):
    comp[index-1].show()
==
