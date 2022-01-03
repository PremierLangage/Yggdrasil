extends = /model/quiz/basic.pl

start == #|python|
from exercises import ExDragDrop

nbstep = 4

sequence = []
solutions = []
feedbacks = []

for i in range(nbstep):
    sequence.append(ExDragDrop())
    sequence[i].question = "Compléter"
    sequence[i].set_labels(["habet", "habent"])
    sequence[i].set_filledtext("Pastor non pecuniam {habet}.")
    sequence[i].inputblock = sequence[i].drops_html() + "\n\n" + sequence[i].labels_html()
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