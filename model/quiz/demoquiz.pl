extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

start == #|python|
from exercises import ExInput
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sequence = []

for i in range(nbstep):
    row = sample_lines[i]
    sequence.append(ExInput())
    sequence[i].question = f"**Phrase {i + 1}.** \n\n {row['phrase']}"
    sequence[i].input._sol = row['rep']

==


intro ==
Ce quiz est composé de 4 question.
==