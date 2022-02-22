extends = /model/basic/basic.pl

# Main keys

question ==
Quelle est la réponse ?
==

# Input block

prefix ==
Réponse :
==

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col-xs" style="padding-left:0.5em; padding-right:0;">
{{ input|component }}
    </div>
  </div>
</div>
==

solution ==
La solution est {{ sol }}.
==


# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from textinput import TextInput
input = TextInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
input.sol = sol
==

# Evaluation scripts

evaluator == #|py|
score = input.eval()
input.display_feedback()
input.disable()
==