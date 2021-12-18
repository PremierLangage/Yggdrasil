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
from customdragdrop import CustomDragDrop
cplabels, cpdrops = [], []
clabels, cdrops= [], []

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

for i, content in enumerate(_labels_):
    cplabels.append(CustomDragDrop.Label(content=content))
    selector = cplabels[i].selector
    cid = cplabels[i].cid
    clabels.append("<%s cid='%s'></%s>" % (selector, cid, selector))

nbdrops = len(_sol_)

for i in range(nbdrops):
    cpdrops.append(CustomDragDrop.Drop())
    selector = cpdrops[i].selector
    cid = cpdrops[i].cid
    cdrops.append("<%s cid='%s'></%s>" % (selector, cid, selector))
==



evaluator ==
n = len(cpdrops)
num_right = 0
num_wrong = 0

for i in range(n):
    if cpdrops[i].content == _sol_[i]:
        num_right += 1
        cpdrops[i].css = "success-state"
    else:
        num_wrong +=1
        cpdrops[i].css += "error-state"

if num_wrong > 0 :
    score = 0
else:
    score = 100
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
