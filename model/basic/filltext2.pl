extends = /model/basic/basic2.pl

# Main keys

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

filledtext ==
* Je voudrais {ces} chausures pour mon anniversaire.
* Tu est toujours en retard, {c'est} agaçant !
* Je n'aime pas {ces} méthodes.
==


# Input block

# Before scripts
jinja_keys = ["inputblock"]

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
sol = []

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

def process_filledtext(filledtext, name):
    sol = []
    counter = 0
    newstring = ''
    start = 0
    for m in re.finditer(r"{([^{}]+)}", filledtext):
        end, newstart = m.span()
        newstring += filledtext[start:end]
        rep = "{{ "+ name + "[" + str(counter) + "]|component }}"
        sol.append(m.group(1)) 
        newstring += rep
        start = newstart
        counter += 1
    newstring += filledtext[start:]
    return sol, newstring

sol, inputblock1 = process_filledtext(filledtext, "input.drops")
input.set_drops(len(sol))
input.set_labels(list(set(sol + _labels_)))
inputblock =  inputblock1 + "\n\n" + input.labels_html()
input.sol = sol
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==

style.dragdrop ==
<style>
.drag-drop-component {
    position: relative;
    cursor: move;
    display: inline-flex;
    padding: 0px;
    box-sizing: border-box;
    min-width: 3em;
    min-height: 2em;
    vertical-align: middle;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 0px solid transparent;
    border-radius: 0px;
    margin: 0px;
}

.drag-drop-component.droppable {
    border: 0px solid #000;
}

.drag-drop-component.droppable.dnd-over,.drag-drop-component.droppable:hover{
    border:0px solid #000
}

</style>
==
