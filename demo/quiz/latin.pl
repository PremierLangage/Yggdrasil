extends = /model/quiz/basic.pl

@ /Languages/Latin/phrases.txt

start == #|python|
from steps import StepTextInput
nbstep = 4

with open('phrases.txt') as f:
    sample_lines = csv_sample(f, nbstep, delimiter='|')

sequence = []

for i in range(nbstep):
    row = sample_lines[i]
    sequence.append(StepTextInput())
    sequence[i].question = f"{row['phrase']}"
    sequence[i].input.sol = row['rep']
    sequence[i].solution = row['rep']
==

intro ==
Ce quiz est composé de 4 questions.
==
