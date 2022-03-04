extends = /model/basic/basic.pl

# Specific keys

sol = ""

items = []

prefix = "Réponse :"

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
from autoinput import AutoInput
input = AutoInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
input.sol = sol
input.set_items(items)
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
    "name": "autoinput",
    "keys": {
        "sol": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des réponses acceptées. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "items": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "prefix": {
            "type": "str",
            "default": "'Réponse :'",
            "description": "Texte affiché à gauche du champ de réponse."
        }
    }
}
==