extends = /model/basic/basic.pl
@ /utils/components/inputfields.py [radiogroup.py]

doc == #|python|
{
    "name": "radio",
    "keys": {
        "items": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items."
        },
        "indsol": {
            "type": "int",
            "default": 0,
            "description": "Indice de la solution dans la liste des items. Note : La numérotation commence à 0."
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

process ==
radio.fill(items, indsol, suffled)
==

inputblock ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==