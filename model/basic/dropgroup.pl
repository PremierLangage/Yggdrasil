extends = /model/basic/basic.pl

# Main keys

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

sol ==

==

labels ==
==

shuffled = True

# Input block

inputblock == #|html|
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

process == #|py|
if isinstance(labels, str):
    _labels_ = labels.splitlines()
elif isinstance(labels, list):
    _labels_ = labels
else:
    _labels_ = []

if nbdrops == -1:
    if isinstance(sol, str):
        _sol_ = sol.splitlines()
    else:
        _sol_ = sol
    input.set_drops(len(_sol_))
    input.sol = _sol_
    for x in _sol_:
        if x not in _labels_:
            _labels_.append(x)
else:
    input.set_drops(nbdrops)

input.set_labels(_labels_)

if shuffled:
    pass
    #input.shuffle()
==

# Evaluation scripts

eval_scripts = ["evaluator", "ending"] 

evaluator == #|py|
# This script can be used to perform a custom evaluation of the answer.
# It should define a variable score and a variable feedback (optional).
# If no variable score is defined, an automatic evaluation of the answer
# will be performed subsequently.
==

ending == #|py|
if 'score' in locals():
    input.score = score
    if 'feedback' in locals():
        input.feedback = feedback
else:
    score = input.eval()
input.display_feedback()
input.disable()
==

apidoc == #|json|
{
    "name": "dropgroup",
    "keys": {
        "nbdrops": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre de zones de dépôt créées. Si cette clé vaut None, le nombre de zones créées est le nombre d'items de la clé `sol`"
        },
        "sol": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des valeurs attendues dans les zones de dépôt. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "labels": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste d'étiquettes supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "shuffled": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si les étiquettes seront mélangées."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
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
