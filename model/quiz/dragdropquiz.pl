extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

before == #|python|
from input import Input
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sol = []
solutions = []
feedbacks = []
questions = []
comp = []

for i in range(nbstep):
    row = sample_lines[i]
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br>

{ row['phrase'] }
"""
    questions.append(qq)
    sol.append(row['rep'])
    solutions.append(row['rep'])
    feedbacks.append('')
    comp.append(Input())
==

intro ==
Ce quiz est composé de 4 question.
==

classexo ==
def ex_eval(step):
    comp[step-1].eval()

def ex_disable(step):
    #comp[step-1].disabled = True
    pass

def ex_show(step):
    pass
==
