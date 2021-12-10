extends = /model/series/series.pl

@ /utils/components/input.py

@ /Languages/Latin/phrases.txt

before == #|python|
state = "active"
score = -1
scores = []

from input import Input

nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')


sol = []
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
    comp.append(Input())

step = 0
==

classexo ==
def ex_eval(step):
    if comp[step-1].value == sol[step-1]:
        return 100
    else:
        return 0

def ex_disable(step):
    comp[step-1].disabled = True

def ex_show(self):
    comp[step-1].score = scores[stept-1]
    comp[step-1].show()
==

intro ==

==
