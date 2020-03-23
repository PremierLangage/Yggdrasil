extends = /model/multistep.pl

before == #|python|
from customradio import CustomRadio
from customcheckbox import CustomCheckbox

pending = False
i = -1
comp = []
textstep = []
statement = []
for line in questions.splitlines()+['']:
    line = line.strip()
    if line.startswith('*'):
        k = 0
        index = []
        items = []
        pending = True
        i += 1
        if line.startswith('**'):
            question_type = "Radio"
            statement.append(line[2:].strip())
        else:
            question_type = "Checkbox"
            statement.append(line[1:].strip())
    if line.startswith(('+','-')):
        items.append(line[1:].strip())
        if line.startswith('+'):
            index.append(k)
        k += 1
    if line == "" and pending:
        if question_type == "Radio":
            comp.append(CustomRadio())
            index = index[0]
        elif question_type == "Checkbox":
            comp.append(CustomCheckbox())
        comp[i].setitems(items)
        comp[i].setsol_from_index(index)
        comp[i].shuffle()
        pending = False

nbstep = i + 1
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

formstep ==
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==
