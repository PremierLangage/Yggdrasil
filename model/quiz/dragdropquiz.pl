extends = /model/quiz/basic.pl

start == #|python|
from steps import SingleInput
from basicinput import *
nbstep = 4

sequence = []
solutions = []
feedbacks = []

for i in range(nbstep):
    sequence.append(SingleInput())
    sequence[i].question = "Compléter"
    sequence[i].inputfield = DropGroup()
    sequence[i].inputfield.set_drops(1)
    sequence[i].inputfield.set_labels(["habet", "habent"])
    #sequence[i].set_filledtext("Pastor non pecuniam {habet}.")
    sequence[i].inputblock = sequence[i].inputfield.drops_html() + "\n\n" + sequence[i].inputfield.labels_html()
    solutions.append("")
    feedbacks.append("")
==

intro ==
Ce quiz est composé de 4 questions.
==