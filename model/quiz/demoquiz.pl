@ /Languages/Latin/phrases.txt

before == #|python|
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