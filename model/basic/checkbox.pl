extends = /model/basic/basic.pl

title = Checkbox

# Specific keys

items = []

indsol = []

shuffled = True

scoring = "RightMinusWrong"

# Question and input block

question ==
==

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
from  basicinput import Checkbox
inputfield = Checkbox()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.set_items(items)
inputfield.set_sol(indsol)
inputfield.scoring = scoring
if shuffled:
    inputfield.shuffle()
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
    "name": "checkbox",
    "keys": {
        "items": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "indsol": {
            "type": "list[int]",
            "default": "[]"
            "description": "Indice des solutions dans la liste des items (la numérotation commence à 0)."
        },
        "shuffled": {
            "type": "bool",
            "default": True,
            "description": "Valeur indiquant si les items seront mélangés."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==