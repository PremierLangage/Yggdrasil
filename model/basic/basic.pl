extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl


before_scripts = ["importfunc", "initinput", "before", "process"]
eval_scripts = ["evaluator", "evalprocess"]
jinja_keys = ["question", "inputblock", "solution"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ /model/tplpage/basic.html
style.basic =@ /model/css/basic.css.html

apidoc == #|json|
{
    "name": "basic",
    "keys": {
        "before": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant de générer les clés de l'exercice."
        },
        "title": {
            "type": "str",
            "default": "",
            "description": "Titre de l'exercice."
        },
        "question": {
            "type": "str",
            "default": "",
            "description": "Template Markdown/HTML contenant l'énoncé de l'exercice."
        },
        "inputblock": {
            "type": "str",
            "default": "",
            "description": "Template Markdown/HTML contenant l'énoncé de l'exercice."
        },
        "solution": {
            "type": "str",
            "default": "",
            "description": "Template Markdown/HTML contenant la correction de l'exercice."
        },
        "evaluator": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant d'évaluer la réponse de l'exercice."
        }
    }
}
==