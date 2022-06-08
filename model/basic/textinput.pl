extends = /model/basic/basic.pl

title = TextInput

# Specific keys

sol = []

diffmeasure = "EditDist"

tol = 0

casesens = False

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
    <div class="col col-sm-6 col-md-4" style="padding-left:0.5em; padding-right:0;">
{{ inputfield|html }}
    </div>
  </div>
</div>
==

# Before scripts

before_scripts = ["importfunc", "initinput", "before", "process"]

importfunc == #|py|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

initinput == #|py|
from basicinput import TextInput
inputfield = TextInput()
==

before == #|py|
# This script can be used to generate
# any keys (items, indsol, etc.)
==

process == #|py|
inputfield.set_sol(sol)
inputfield.evalparam = {'diffmeasure':diffmeasure, 'tol':tol, 'casesens':casesens}
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
    "name": "textinput",
    "keys": {
        "sol": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des réponses acceptées. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "diffmeasure": {
            "type": "('EditDist', 'EditRation')",
            "default": "'EditDist'",
            "description": "Mesure utilisée pour calculer l'écart entre la réponse saisie et les réponses acceptées."
        },
        "tol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Ecart maximum (par rapport à la mesure définie dans `diffmeasure`) pour considérer une réponse comme correcte."
        },
        "casesens": {
            "type": "bool",
            "default": "False",
            "description": "Valeur indiquant si la casse est prise en compte pour évaluer la réponse."
        },
        "prefix": {
            "type": "str",
            "default": "'Réponse :'",
            "description": "Texte affiché à gauche du champ de réponse."
        }
    }
}
==
