extends = /model/basic/basic.pl
@ /utils/components/radio.py [radio.py]

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
radio.set_items(items)
radio.set_sol(indsol)

if shuffled:
    radio.shuffle()
==

inputblock ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==