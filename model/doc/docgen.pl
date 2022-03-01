@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
doc == #|json|
{
    "name": "textinput",
    "keys": {
        "sol": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des réponses acceptées. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "diffmeasure": {
            "type": "('EditDist', 'EditRation')",
            "default": "'EditDist'",
            "description": "Mesure utilisée pour calculer l'écart entre la réponse saisie et les réponses acceptées."
        },
        "tol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Ecart maximum (par rapport à la mesure définie dans `diffmeasure`) pour considérer une réponse comme correcte."
        },
        "casesens": {
            "type": "bool",
            "default": "False",
            "description": "Valeur indiquant si la casse est prise en compte pour évaluer la réponse."
        },
        "prefix": {
            "type": "str",
            "default": "'Réponse :'",
            "description": "Texte affiché à gauche du champ de réponse."
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

