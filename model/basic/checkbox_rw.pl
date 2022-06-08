extends = /model/basic/basic.pl

title = Checkbox

# Specific keys

right = []

wrong = []

nbitems = 0

minright = 0

maxright = 0

scoring = "AllOrNothing"

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
from basicinput import Checkbox
inputfield= Checkbox()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.fill_from_rw(right, wrong, nbitems, randint(minright, maxright))
inputfield.scoring = scoring
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
    "name": "checkbox_rw",
    "keys": {
        "right": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des bonnes réponses. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "wrong": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des mauvaises réponses. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "nbitems": {
            "type": "int",
            "default": "0",
            "description": "Nombre d'items à proposer."
        },
        "minright": {
            "type": "int",
            "default": "0",
            "description": "Nombre minimum de bonnes réponses à proposer."
        },
        "maxright": {
            "type": "int",
            "default": "0",
            "description": "Nombre minimum de bonnes réponses à proposer."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==