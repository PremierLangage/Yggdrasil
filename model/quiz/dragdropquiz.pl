extends = /model/quiz/basic.pl

before ==
from customdragdrop import LabelGroup, DropGroup, process_filledtext

lab = []
drp = []
questions = ["gg"]
feedbacks = ["gg"]

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
