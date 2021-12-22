extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

before == #|python|
from customdragdrop import LabelGroup, DropGroup, process_filledtext

lab = []
drp = []

sol = []
solutions = []
feedbacks = []
questions = []

from input import Input
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sol = []
solutions = []
feedbacks = []
questions = []
comp = []
inputblocks = []

for i in range(nbstep):
    questions.append("Compléter")
    lab.append(LabelGroup(["AA", "BB"]))
    drp.append(DropGroup(["AA", "BB"]))
    inputblocks.append("{{ drp[" + str(i) + "].comp[0]|component }}" + lab[i].paste_all())
    solutions.append("")
    feedbacks.append('')
==



old ==
for i in range(2):
    lab.append(LabelGroup(["AA", "BB"]))
    #sol, newstring = process_filledtext("{AA} et {BB}", f"drp[{i}].comp")
    drp.append(DropGroup(["AA", "BB"]))
    #drp[i]._sol = sol
    #newstring = ""
    #questions.append("")
    #feedbacks.append('')
    
==

intro ==
Ce quiz est composé de 4 questions.
==

classexo ==
def ex_eval(step):
    return drp[step-1].eval()

def ex_disable(step):
    pass

def ex_show(step):
    pass
==
