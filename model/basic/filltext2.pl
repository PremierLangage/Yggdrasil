extends = /model/basic/basic2.pl

# Main keys

question ==
Quelle est la réponse ?
==


# Input block

inputblock == #|html|
{{ input.drops[0]|component }}
{{ input.drops[1]|component }}
{{ input.labels[0]|component }}
{{ input.labels[1]|component }}
{{ input.labels[2]|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from dropgroup import DropGroup
input = DropGroup()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
input.set_drops(2)
input.set_labels(["AA", "BB", "CC"])
input.sol = ["AA", "BB"]
==

process == #|py|

==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==


process ==
def process_filledtext(filledtext, name):
    counter = 0
    newstring = ''
    start = 0
    for m in re.finditer(r"{([^{}]+)}", filledtext):
        end, newstart = m.span()
        newstring += filledtext[start:end]
        sol.append(m.group(1))
        rep = "{{" + f"{name}[{counter}]" + "|component }}"
        newstring += rep
        start = newstart
        counter += 1
    newstring += filledtext[start:]
    self.embed = newstring
    return sol, inputblock

sol, inputblock = rocess_filledtext(filledtext, "input.drops")
if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

drp = DropGroup()
drp.set_filledtext(filledtext)

_labels_ = list(set(_labels_ + drp._sol))
lab = LabelGroup(_labels_)


inputblock = drp.paste_embed() +"\n\n" + lab.paste_all()
==
