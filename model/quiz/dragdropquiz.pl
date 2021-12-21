extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

before ==
from customdragdrop import LabelGroup, DropGroup

lab = []
drp = []
for i in range(2):
    lab.append(LabelGroup(["AA", "BB"]))
    drp.append(DropGroup(["AA", "BB"]))
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br>

{ row['phrase'] }
"""
==

intro ==
Ce quiz est composé de 4 question.
==

classexo ==
def ex_eval(step):
    drp[step-1].eval()

def ex_disable(step):
    #comp[step-1].disabled = True
    pass

def ex_show(step):
    pass
==
