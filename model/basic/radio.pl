extends = /model/basic/basic.pl
@ /utils/components/radio.py [radio.py]

doc == #|python|
{
    "name": "radio",
    "keys": {
        "items": {
            "type": "(str, list)",
            "default": "",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "indsol": {
            "type": "int",
            "default": 0,
            "description": "Indice de la solution dans la liste des items (la numérotation commence à 0)."
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
radio.fill(items, indsol, shuffled)
==

inputblock ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==