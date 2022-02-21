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
from multinput import MultInput()
group = MultInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
input.set_items(items)
input.set_sol(indsol)
if shuffled:
    input.shuffle()
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==