extends = /model/basic/basic2.pl

# Main keys

question ==
Quelle est la réponse ?
==

# Input block

inputblock == #|html|
{{ input|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from inputgroup import InputGroup()
from textinput import TextInput()
from radio import Radio()
group = InputGroup()
==

before == #|py|
group.inputs = [TextInput(), Radio()]

group.inputs[0].sol = "toto"
group.inputs[1].set_items(["AA", "BB", "CC"])
group.inputs[1].set_sol(0)
==

process == #|py|
input.set_items(items)
input.set_sol(indsol)
if shuffled:
    input.shuffle()
==

# Evaluation scripts

evaluator == #|py|
score = group.eval()
group.display_feedback()
group.disable()
==