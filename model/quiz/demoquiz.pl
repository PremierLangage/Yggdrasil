extends = /model/quiz/quiz.pl

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

classexo ==
def ex_eval(step):
    if comp[step-1].value == sol[step-1]:
        return 100
    else:
        return 0

def ex_disable(step):
    comp[step-1].disabled = True

def ex_show(step):
    comp[step-1].score = scores[step-1]
    comp[step-1].show()
==