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

for i in range(0):
    rox = sample_lines[i]
    comp.append(Input())
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br> 

{ row.phrase }
"""
    questions.append(qq)
    sol.append(row.rep)
    comp.append(Input())

step = 0
==

intro ==
{{ sample_lines }}
==
