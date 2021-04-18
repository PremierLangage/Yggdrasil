extends = /model/multistep.pl

@ phrases.txt

title = Traduire des mots en contexte

nbstep % 3
settings.cumulative % false

before == #|python|
import random as rd
from components import Input

try:
    with open('data.csv', newline='') as file:
        all_lines = list(DictReader(file, delimiter=delimiter))
except:
    if 'data' in globals():
        all_lines = list(DictReader(StringIO(data), delimiter=delimiter))


sample_lines = rd.sample(all_lines, nbstep)

sol = []
phrases = []
inputs = []
for i in range(nbstep):
    inputs.append(Input())
    phrases.append(data[0].strip())
    sol.append(data[1].strip())
==

intro ==
Pour chacune des {{nbstep}} phrases suivantes, traduire en latin le mot en gras (avec le bon cas).
==

textstep ==
<strong> Phrase {{ step + 1 }}. </strong><br> 

{{ phrases[step] }}
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

inputs[step].disabled = True
==

