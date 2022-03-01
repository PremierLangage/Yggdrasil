@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

doc == #|py|
{
    "name": "sortlist",
    "keys": {
        "sortedlist": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste des items. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "nbitems": {
            "type": "(int, None)",
            "default": None,
            "description": "Nombre d'items à ordonner parmi la liste d'items. Si ce nombre n'est pas précisé, tous les items de la liste sont pris."
        },
        "scoring": {
            "type": "('KendalTau', 'ExactOrder')",
            "default": "'KendalTau'",
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

