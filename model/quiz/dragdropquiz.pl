extends = /model/quiz/basic.pl

before ==
from customdragdrop import LabelGroup, DropGroup, process_filledtext

lab = []
drp = []
questions = []
feedbacks = []
for i in range(2):
    lab.append(LabelGroup(["AA", "BB"]))
    sol, newstring = process_filledtext("{AA} et {BB}", f"drp[{i}]")
    drp.append(DropGroup(["AA", "BB"]))
    drp[i]._sol = sol
    newstring = ""
    questions.append("")
    feedbacks.append('')
    
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
