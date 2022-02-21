extends = /model/basic/basic2.pl

# Main keys

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

filledtext ==
* Je voudrais {ces} chausures $! \frac 3 4 !$ pour mon anniversaire.
* Tu est toujours en retard, {c'est} agaçant !
* Je n'aime pas {ces} méthodes.
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

==

process == #|py|
import re

def process_filledtext(filledtext, name):
    counter = 0
    sol = []
    newstring = ''
    start = 0
    for m in re.finditer(r"{([^{}]+)}", filledtext):
        end, newstart = m.span()
        newstring += filledtext[start:end]
        sol.append(m.group(1))
        rep = "{{" + f"{name}[" + str(counter) + "]|component }}"
        newstring += rep
        start = newstart
        counter += 1
    newstring += filledtext[start:]
    return sol, newstring

sol, inputblock = process_filledtext(filledtext, "input.drops")
inputblock = ""
input.set_drops(len(sol))
input.set_labels(sol)
input.sol = sol
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==
