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
checkbox.decorator = Checkbox

shuffled = True

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

checkbox.set_items(items)
checkbox.set_sol(indsol)
if shuffled:
    checkbox.shuffle()
==

inputblock ==
{{ checkbox|component }}
==

evaluator ==
score = checkbox.eval()
==