extends = /model/series/series.pl

@ /Languages/Latin/phrases.txt

before == #|python|
state = "active"
score = -1
scores = []

from components import Input

nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep)


sol = []
questions = []
comp = []

for i in range(0):
    data = sample_lines[i].split("|")
    comp.append(Input())
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br> 

{ data[0].strip() }
"""
    questions.append(qq)
    sol.append(data[1].strip())

step = 0
==

intro ==
{{ sample_lines }}
==
