extends = /model/multistep.pl

@ /utils/format/AMC.py

settings.cumulative % false



before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from AMC import parse_AMC_TXT

list_questions = parse_AMC_TXT(questions)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

comp = []
statement  = []

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(Radio())
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
    elif  q['type'] == 'TextSelect':
        # comp.append(CustomTextSelect())
        continue # no implemented yet 
    statement.append(q['text'])
    comp[i].setitems(q['items'])
    comp[i].setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        comp[i].shuffle()
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] }}
==

formstep ==
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==




