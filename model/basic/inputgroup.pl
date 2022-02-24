extends = /model/basic/basic.pl

# Main keys

question ==
Quelle est la réponse ?
==

# Input block

inputblock == #|html|
{{ inputs[0]|component }}
{{ inputs[1]|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]
jinja_keys = ["question", "inputblock", "solution"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from textinput import TextInput
from numinput import NumInput
from radio import Radio
from checkbox import Checkbox
weights = []
==

before == #|py|
inputs = [TextInput(), Radio()]

inputs[0].sol = "toto"
inputs[1].set_items(["AA", "BB", "CC"])
inputs[1].set_sol(0)
==

process == #|py|

==

# Evaluation scripts

evaluator == #|py|
def average(lst):
    return sum(lst)//len(lst)

# Evaluate all input fields
for input in inputs:
    input.eval()
    
scores = [input.score for input in inputs]
if -1 in scores:
    score = -1
else:
    score = average(scores)

# display feedback
if score == -1:
    for input in inputs:
        if input.score == -1:
            input.display_feedback()
        else:
            input.hide_feedback()
else:
    for input in inputs:
        input.display_feedback()

# disable
if score != -1:
    for input in inputs:
        input.disable()
==