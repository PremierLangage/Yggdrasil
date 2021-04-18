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
        all_lines = rd.sample(list(DictReader(file, delimiter=delimiter)), nbstep)
except:
    if 'data' in globals():
        all_lines = rd.sample(list(DictReader(StringIO(data), delimiter=delimiter)), nbstep)

sol = []
lines = []
inputs = []
for i in range(nbstep):
    inputs.append(Input())
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

