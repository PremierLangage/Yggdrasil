@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "dropgroup",
    "keys": {
        "nbdrops": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre de zones de dépôt créées. Si cette clé vaut None, le nombre de zones créées est le nombre d'items de la clé `sol`"
        },
        "sol": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des valeurs attendues dans les zones de dépôt. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "labels": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste d'étiquettes supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "shuffled": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si les étiquettes seront mélangées."
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
doc = eval(apidoc)
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

