extends = /model/AMC_TXT.pl

# set this variable to on in the exercice to shuffle questions
randomize_questions = off

before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from AMC import parse_AMC_TXT

list_questions = parse_AMC_TXT(questions)

if randomize_questions == 'on':
    rd.shuffle(list_questions)

if 'nbstep' in globals():
    nbstep = min(int(nbstep),len(list_questions))
    list_questions = list_questions[:nbstep]
else:
    nbstep = len(list_questions)


comp = []
statement  = []

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(CustomRadio())
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
    statement.append(q['text'])
    comp[i].setitems(q['items'])
    comp[i].setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        comp[i].shuffle()
==


