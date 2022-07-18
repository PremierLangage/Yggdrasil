extends = /model/quiz/basic.pl

@ /utils/format/AMC.py

start == #|python|
from AMC import parse_AMC_TXT
from steps import StepRadio, StepCheckbox

list_questions = parse_AMC_TXT(quiz)

if 'nbstep' in globals():
    list_questions = sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

sequence = []
for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        sequence.append(StepRadio())
        sequence[i].set_items(q['items'])
        sequence[i].set_sol(q['index'])
    elif q['type'] == "Checkbox":
        sequence.append(StepCheckbox())
        sequence[i].set_items(q['items'])
        sequence[i].set_sol(q['index'])
    sequence[i].question = q['text']
    if 'ordered' not in q['options']:
        sequence[i].input.shuffle()
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