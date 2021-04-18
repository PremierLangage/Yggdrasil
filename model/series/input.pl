extends = /model/multistep.pl


title = Traduire des mots en contexte

nbstep % 3
settings.cumulative % false

before == #|python|
import random as rd
from io import StringIO
from csv import DictReader
from components import Input

try:
    with open('data.csv', newline='') as file:
        all_lines = list(DictReader(file, delimiter=delimiter))
except:
    if 'data' in globals():
        all_lines = list(DictReader(StringIO(data), delimiter=delimiter))

lst=[3,4,5]
#sample_lines = rd.sample(all_lines, nbstep)
sample_line = lst
sol = []
lines = []
inputs = []
for i in range(nbstep):
    inputs.append(Input())
    #lines.append(all_lines[i])
    sol.append(data[1].strip())
==

intro ==
Pour chacune des {{nbstep}} phrases suivantes, traduire en latin le mot en gras (avec le bon cas).
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

