extends = /model/basic/basic2.pl

# Main keys

question ==
Quelle est la réponse ?
==


# Input block

inputblock == #|html|
{{ input.drops[0]|component }}
{{ input.drops[1]|component }}
{{ input.drops[2]|component }}
{{ input.labels[0]|component }}
{{ input.labels[1]|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from dragdrop import DragDropGroup
input = DragDropGroup()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
input.set_drops(2)
input.set_labels(["AA", "BB", "CC"])
==

process == #|py|

==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==
