extends = /model/series/series.pl

@ /Languages/Latin/phrases.txt

before == #|python|
state = "active"
score = -1
scores = []

from components import Input

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
class Exo:

    def __init__(self, step):
        self.step = step

    def eval(self):
        if comp[self.step-1].value == sol[self.step-1]:
            return 100
        else:
            return 0

    def disable(self):
        comp[self.step-1].disable()

    def show(self):
        comp[self.step-1].show()
==

intro ==

==
