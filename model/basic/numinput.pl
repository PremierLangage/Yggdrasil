extends = /model/basic/basic.pl

title = NumInput

# Specific keys

sol = 0

diffmeasure = "AbsError"

tol = 0

prefix ==
Réponse :
==

# Input block

inputblock ==
<div class="container">
  <div class="row align-items-center">
    <div class="col-auto" style="padding:0;">
{{ prefix }} 
    </div>
    <div class="col-xs" style="padding-left:0.5em; padding-right:0;">
{{ inputfield|html }}
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
from basicinput import NumInput
inputfield = NumInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.evalparam = {'diffmeasure': diffmeasure, 'tol': tol}
inputfield.sol = sol
==

# Evaluation scripts

eval_scripts = ["evaluator", "ending"] 

evaluator == #|py|
# This script can be used to perform a custom evaluation of the answer.
# It should define a variable score and a variable feedback (optional).
# If no variable score is defined, an automatic evaluation of the answer
# will be performed subsequently.
==

ending == #|py|
if 'score' in locals():
    inputfield.score = score
    if 'feedback' in locals():
        inputfield.feedback = feedback
else:
    score = inputfield.eval()
inputfield.display_feedback()
inputfield.disable()
==

# API documentation

apidoc == #|json|
{
    "name": "numinput",
    "keys": {
        "sol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Bonne réponse."
        },
        "diffmeasure": {
            "type": "('AbsError', 'RelError')",
            "default": "'AbsError'",
            "description": "Mesure utilisée pour calculer l'écart entre la réponse saisie et la réponse acceptée."
        },
        "tol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Ecart maximum (par rapport à la mesure définie dans `diffmeasure`) pour considérer une réponse comme correcte."
        },
        "prefix": {
            "type": "str",
            "default": "'Réponse :'",
            "description": "Texte affiché à gauche du champ de réponse."
        }
    }
}
==