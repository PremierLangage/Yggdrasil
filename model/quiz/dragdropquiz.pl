extends = /model/quiz/basic.pl

start == #|python|
from steps import StepDragDrop

nbstep = 4

sequence = []
solutions = []
feedbacks = []

for i in range(nbstep):
    sequence.append(StepDropGroup())
    sequence[i].question = "Compléter"
    sequence[i].input.set_drops(1)
    sequence[i].input.set_labels(["habet", "habent"])
    #sequence[i].set_filledtext("Pastor non pecuniam {habet}.")
    sequence[i].inputblock = sequence[i].drops_html() + "\n\n" + sequence[i].labels_html()
    solutions.append("")
    feedbacks.append("")
==

intro ==
Ce quiz est composé de 4 questions.
==