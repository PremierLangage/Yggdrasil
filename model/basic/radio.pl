extends = /model/basic/basic.pl
@ /utils/components/scoring.py
@ /utils/components/radio.py [radio.py]

doc == #|python|
{
    "name": "radio",
    "keys": {
        "items": {
            "type": "(str, list)",
            "default": "",
            "description": "Liste des items."
        },
        "indsol": {
            "type": "int",
            "default": 0,
            "description": "Indice de la solution dans la liste des items."
        },
        "shuffled": {
            "type": "bool",
            "default": True,
            "description": "Valeur indiquant si les items seront mélangés."
        }
    }
}
==

indsol = 0

items =

shuffled = True

radio =: RadioGroup
radio.decorator = Radio

before_scripts % ["importfunc", "before", "process"]

process ==
from ast import literal_eval

indsol = literal_eval(str(indsol))
shuffled = literal_eval(str(shuffled))

radio.setitems(items)
radio.setsol_from_index(indsol)

if shuffled:
    radio.shuffle()
==

inputblock ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
radio.disabled = True
==