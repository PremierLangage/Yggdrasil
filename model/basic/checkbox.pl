extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/checkbox.py [checkbox.py]

doc == #|python|
{
    "name": "checkbox",
    "keys": {
        "items": {
            "type": "(str, list)",
            "default": "",
            "description": "Liste des items."
        },
        "indsol": {
            "type": "list",
            "default": [],
            "description": "Indices des solutions dans la liste des items."
        },
        "shuffled": {
            "type": "bool",
            "default": True,
            "description": "Valeur indiquant si les items seront mélangés."
        }
    }
}
==

checkbox =: CheckboxGroup
checkbox.decorator = CustomCheckbox

shuffled = True

before_scripts % ["importfunc", "before", "process"]

importfunc ==
from random import randint, choice, choices, sample, shuffle
==

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

checkbox.set_items(items)
checkbox.set_sol(indsol)
if shuffled:
    checkbox.shuffle()
==

settings.feedback = lightscore

inputblock ==
{{ checkbox|component }}
==

evaluator ==
feedback = " "
score = checkbox.eval()
==