extends = /model/basic/basic.pl

title = Radio

# Main keys

question ==
Quelle est la réponse ?
==

items ==
Item 0
Item 1
Item 2
==

indsol = 0

shuffled = True

# Input block

inputblock == #|html|
{{ inputfield|html }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from basicinput import Radio
inputfield = Radio()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.set_items(items)
inputfield.set_sol(indsol)
if shuffled:
    inputfield.shuffle()
==

# Evaluation scripts

evaluator == #|py|
score = inputfield.eval()
inputfield.display_feedback()
inputfield.disable()
==

apidoc == #|json|
{
    "name": "radio",
    "keys": {
        "items": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "indsol": {
            "type": "int",
            "default": 0,
            "description": "Indice de la solution dans la liste des items (la numérotation commence à 0)."
        },
        "shuffled": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si les items seront mélangés."
        }
    }
}
==