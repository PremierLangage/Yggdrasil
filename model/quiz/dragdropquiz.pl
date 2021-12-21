extends = /model/quiz/basic.pl

before ==
from customdragdrop import LabelGroup, DropGroup, process_filledtext

lab = []
drp = []

from input import Input
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sol = []
solutions = []
feedbacks = []
questions = []

for i in range(2):
    questions.append("qq")
    solutions.append("hh")
    feedbacks.append("jj")
==

old ==
for i in range(2):
    lab.append(LabelGroup(["AA", "BB"]))
    #sol, newstring = process_filledtext("{AA} et {BB}", f"drp[{i}]")
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
    drp[step-1].eval()

def ex_disable(step):
    pass

def ex_show(step):
    pass
==
