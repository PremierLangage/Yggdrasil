extends = /model/multistep.pl

@ phrases.txt

title = Traduire des mots en contexte

nbstep % 3
settings.cumulative % false

before == #|python|
import random as rd
from components import Input

with open('phrases.txt') as file:
    all_lines = [line for line in file.readlines() if line.strip()]

sample_lines = rd.sample(all_lines, nbstep)

sol = []
phrases = []
inputs = []
for i in range(nbstep):
    data = sample_lines[i].split("|")
    inputs.append(Input())
    phrases.append(data[0].strip())
    sol.append(data[1].strip())
==

intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
Traduire en latin le mot en gras (avec le bon cas).

*{{ phrases[step] }}*
==

formstep ==
{{ inputs[step]|component }}
==

evaluatorstep ==
if inputs[step].value == sol[step]:
    score = 100
    feedback = ""
else:
    score = 0
    feedback = sol[step]
==

