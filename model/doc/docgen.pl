@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

doc == #|json|
{
    "name": "checkbox_rw",
    "keys": {
        "right": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des bonnes réponses. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "right": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des mauvaises réponses. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "nbitems": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre d'items à proposer. Si cette clé vaut None, tous les items sont proposés."
        },
        "minright": {
            "type": "int",
            "default": "0",
            "description": "Nombre minimum de bonnes réponses à proposer."
        },
        "maxright": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre minimum de bonnes réponses à proposer. Si cette clé vaut None, toutes les bonnes réponses sont proposées."
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

