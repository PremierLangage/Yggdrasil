@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

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

before== #|python|
doc = eval(doc)
==

evaluator== #|python|
grade = (100, 'OK')
==

#! linter:require:a


title=
form ==
{{ doc.name }}
==

text =@ template.html

