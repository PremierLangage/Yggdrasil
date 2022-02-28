extends = /model/basic/basic.pl

# Main keys

question ==
Quelle est la réponse ?
==

multiple = False

nbmatches = None
targets = []

separator = ","

scoring = RightMinusWrong


# Input block

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
input.set_items(items)
input.set_sol(indsol)
if shuffled:
    input.shuffle()
==

process ==
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