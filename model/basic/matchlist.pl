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
from matchlist import MatchList
input = MatchList()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
import random as rd

if isinstance(matches, str): 
    _matches_ = [match.split(separator) for match in matches.splitlines()]
else:
    _matches_ = matches

if isinstance(targets, str): 
    _targets_ = targets.splitlines()
else:
    _targets_ = targets

if isinstance(nbmatches, int):
    _nbmatches_ = nbmatches
else:
    _nbmatches_ = len(_matches_)

input.set_data_from_matches(rd.sample(_matches_, _nbmatches_))
input.add_targets(_targets_)
input.shuffle()
input.scoring = scoring

if multiple:
    input.set_multiple()
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
    "name": "matchlist",
    "keys": {
        "matches": {
            "matches": "(str, list[tuple[str, str]]",
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
            "default": "None"
            "description": "Nombre de correspondances à proposer parmi la liste de correspondances. Si cette clé vaut `None`, toutes les correspondances sont proposées."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
        }
    }
}
==