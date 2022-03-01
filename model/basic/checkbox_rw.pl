extends = /model/basic/basic.pl

# Specific keys

right = []

wrong = []

nbitems = None

minright = 0

maxright = None

scoring = "AllOrNothing"

# Question and input block

question ==
==

inputblock == #|html|
{{ input|component }}
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from checkbox import Checkbox
input = Checkbox()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
input.fill_from_rw(right, wrong, nbitems, randint(minright, maxright))
input.scoring = scoring
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
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
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre d'items à proposer. Si cette clé vaut None, tous les items sont proposés."
        },
        "minright": {
            "type": "int",
            "default": "0",
            "description": "Nombre minimum de bonnes réponses à proposer."
        },
        "maxright": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre minimum de bonnes réponses à proposer. Si cette clé vaut None, toutes les bonnes réponses sont proposées."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==