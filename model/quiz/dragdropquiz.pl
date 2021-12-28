extends = /model/quiz/basic.pl

start == #|python|
from exercises import ExDragDrop

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

for i in range(nbstep):
    sequence.append(ExDragDrop())
    sequence[i].question = "Compléter"
    sequence[i].set_labels(["habet", "habent"])
    sequence[i].set_filledtext("Pastor non pecuniam {habet}.")

    #questions.append("Compléter")
    #lab.append(LabelGroup(["habet", "habent"]))
    #drp.append(DropGroup())
    #drp[i].set_filledtext("Pastor non pecuniam {habet}.")
    #inputblocks.append(drp[i].paste_embed() +"\n\n" + lab[i].paste_all())
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
