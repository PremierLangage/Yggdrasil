extends = /model/basic/basic.pl

# Main keys

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

sol ==
ces
c'est
ces
==


# Input block

inputblock2 == #|html|
* Je voudrais {{ input.drops[0]|component }} chausures pour mon anniversaire.
* Tu est toujours en retard, {{ input.drops[1]|component }} agaçant !
* Je n'aime pas {{ input.drops[2]|component }} méthodes.

{{ input.labels[0]|component }} {{ input.labels[1]|component }}
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
