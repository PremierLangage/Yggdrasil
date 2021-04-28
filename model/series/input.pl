extends = /model/multistep.pl


title = Traduire des mots en contexte

nbstep % 3
settings.cumulative % false

before == #|python|
import random as rd
from io import StringIO
from csv import DictReader
from components import Input
"""
try:
    with open('data.csv', newline='') as file:
        datasample = rd.sample(list(DictReader(file, delimiter=delimiter)), nbstep)
except:
    if 'data' in globals():
        datasample = rd.sample(list(DictReader(StringIO(data), delimiter=delimiter)), nbstep)
"""
try:
    datasample = frandsample('data.csv', delimiter=delimiter, nbstep)
except:
    datasample = srandsample(data, delimiter=delimiter, nbstep)

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

