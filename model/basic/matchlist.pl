# DO NOT MODIFY THIS FILE !

# Ce modèle permet de fabriquer des exercices de correspondances.

extends = /model/basic/basic.pl

# Specific keys

matches = []

nbmatches = None

separator = ","

targets = []

multiple = False

scoring = RightMinusWrong

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
from basicinput import MatchList
inputfield = MatchList()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.set_data_from_matches(matches, separator, nbmatches)
inputfield.add_targets(targets)
inputfield.shuffle()
inputfield.scoring = scoring
if multiple:
    inputfield.set_multiple()
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
    "name": "matchlist",
    "keys": {
        "matches": {
            "type": "(str, list[tuple[str, str]]",
            "default": "[]",
            "description": "Liste des correspondances (source, cible). Elle peut être saisie comme une liste de couples ou comme une chaîne multilignes (chaque ligne correspondant à une correspondance, les deux éléments étant distingués par un séparateur défini dans la clé `separator`)."
        },
        "separator": {
            "type": "str",
            "default": "','",
            "description": "Séparateur des éléments d'une correspondance (source, cible)."
        },
        "nbmatches": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre de correspondances à proposer parmi la liste de correspondances. Si cette clé vaut `None`, toutes les correspondances sont proposées."
        },
        "targets": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste de cibles supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "multiple": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si une cible peut être reliée à plusieurs sources."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==