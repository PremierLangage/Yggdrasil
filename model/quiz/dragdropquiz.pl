extends = /model/quiz/basic.pl

before == #|python|
from customdragdrop import LabelGroup, DropGroup

lab = []
drp = []

sol = []
solutions = []
feedbacks = []
questions = []

from input import Input
nbstep = 4

sol = []
solutions = []
feedbacks = []
questions = []
comp = []
inputblocks = []

for i in range(nbstep):
    questions.append("Compléter")
    lab.append(LabelGroup(["habet", "habent"]))
    drp.append(DropGroup())
    drp[i].set_filledtext("Pastor non pecuniam {habet}.")
    inputblocks.append(drp[i].paste_embed() +"\n\n" + lab[i].paste_all())
    solutions.append("")
    feedbacks.append("")
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
