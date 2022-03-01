@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

doc == #|json|
{
    "name": "checkbox",
    "keys": {
        "items": {
            "type": "(str, list[str])",
            "default": "",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "indsol": {
            "type": "list[int]",
            "default": "[]",
            "description": "Indice des solutions dans la liste des items (la numérotation commence à 0)."
        },
        "shuffled": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si les items seront mélangés."
        },
        "scoring": {
            "type": "('AllOrNothing', 'RightMinusWrong', 'CorrectItems')",
            "default": "'RightMinusWrong'",
            "description": "Barème de l'exercice."
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

