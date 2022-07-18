extends = /model/basic/basic.pl

title = FillText

# Main keys

question ==
Compléter les phrases suivantes avec les étiquettes proposées.
==

filledtext ==
==

delimiters = ["{", "}"]

labels = []

scoring = "RightMinusWrong"

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
from basicinput import DropGroup
inputfield = DropGroup()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)

==

process == #|py|
from basicinput import process_filledtext
sol, dropblock, solution = process_filledtext(filledtext, delimiters, "inputfield.drops", "color:green")
inputfield.set_drops(len(sol))
labels2 = list(set(sol+labels))
shuffle(labels2)
inputfield.set_labels(labels2)
inputblock =  dropblock + "\n\n" + inputfield.labels_html()
inputfield.sol = sol
del dropblock
==

# Evaluation scripts

evaluator == #|py|
score = inputfield.eval()
inputfield.display_feedback()
inputfield.disable()
==

# API documentation

apidoc == #|json|
{
    "name": "filltext",
    "keys": {
        "filledtext": {
            "type": "str",
            "default": "",
            "description": "Texte complet, avec les parties à compléter spécifiées par les délimiteurs définies dans la clé `delimiters`."
        },
        "delimiters": {
            "type": "lst[str]",
            "default": "['{', '}']",
            "description": "Délimiteurs utilisés pour spécifier les parties à compléter."
        },
        "labels": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste d'étiquettes supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==

style.dragdrop ==
<style>
.drag-drop-component {
    position: relative;
    cursor: move;
    display: inline-flex;
    padding: 0px;
    box-sizing: border-box;
    //min-width: 3em;
    //min-height: 1.5em;
    vertical-align: middle;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 0px solid transparent;
    //border-radius: 0px;
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
