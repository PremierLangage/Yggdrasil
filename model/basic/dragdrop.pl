extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/dragdrop.py [customdragdrop.py]

settings.feedback = lightscore

title =

labels = []

before_scripts = ["importfunc", "before", "process"]
jinja_keys = ["question", "inputblock"]

importfunc ==
from random import randint, choice, choices, sample, shuffle
==

inputblock = 

process ==
from customdragdrop import LabelGroup, DropGroup

if isinstance(sol, str):
    _sol_ = sol.splitlines()
else:
    _sol_ = sol

if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

_labels_ = list(set(_labels_ + _sol_))

lab = LabelGroup(_labels_)
drp = DropGroup(_sol_)
==



evaluator ==
score = drp.eval()
==

question ==
Compléter les phrases suivantes avec les étiquettes proposées.

* Je voudrais {{ drp.comp[0]|component }} chausures pour mon anniversaire.
* Tu est toujours en retard,{{ drp.comp[1]|component }} agaçant !
* Je n'aime pas {{ drp.comp[2]|component }} méthodes.

{{ lab.comp[0]|component }} {{ lab.comp[1]|component }}
==

sol ==
ces
c'est
ces
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

