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

# Style

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
