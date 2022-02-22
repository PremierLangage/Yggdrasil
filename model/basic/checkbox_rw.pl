extends = /model/basic/basic.pl

# Main keys

question ==
Quelle est la réponse ?
==

right ==
bonjour
abc
oui
NON
Ciao
good_morning
byeBye7
\_UGE\_
==


wrong ==
Hi!
au revoir
6hello6
def
for
good-afternoon
f()
==

scoring = AllOrNothing

shuffled = True

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
input.fill_from_rw(right, wrong, nbitems, randint(minright, maxright))
input.scoring = scoring
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==