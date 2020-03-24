extends = /model/multistep.pl
@ /utils/format/AMC.py
settings.cumulative % false

before == #|python|
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from AMC import parse_AMC_TXT


list_questions = parse_AMC_TXT(questions)

nbstep = len(list_questions)

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(CustomRadio())
    elif question_type == "Checkbox":
        comp.append(CustomCheckbox())
    comp[i].setitems(items)
    comp[i].setsol_from_index(index)
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

