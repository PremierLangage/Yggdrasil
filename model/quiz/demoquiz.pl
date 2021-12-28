extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

before == #|python|
from input import Input
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sequence = []

for i in range(nbstep):
    row = sample_lines[i]
    qq = rf"""
<strong> Phrase {i + 1}. </strong><br>

{ row['phrase'] }
"""
    #sequence.append(ExInput())
    #sequence[i].question = qq
    #sequence[i].input._sol = row['rep']

==

intro ==
Ce quiz est composé de 4 question.
==