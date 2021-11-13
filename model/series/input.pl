extends = /model/multistep.pl
@ /utils/plcsv.py

title = Traduire des mots en contexte

nbstep % 3
settings.cumulative % false

before == #|python|
from components import Input
from plcsv import csv_sample

try:
    with open('data.csv', newline='') as f:
        datasample = csv_sample(f, nbstep, delimiter=delimiter)
except:
    datasample = csv_sample(data, nbstep, delimiter=delimiter)


sol = []
lines = []
inputs = []
for i in range(nbstep):
    inputs.append(Input())
    sol.append(datasample[i][solcol])
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

