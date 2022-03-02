@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "filltext",
    "keys": {
        "filledtext": {
            "type": "str",
            "default": "",
            "description": "Texte complet, avec les parties à compléter spécifiées par les délimiteurs définies dans la clé `delimiters`."
        },
        "delimiters": {
            "type": "lst[str]",
            "default": "['{', '}']",
            "description": "Délimiteurs utilisés pour spécifier les parties à compléter."
        },
        "labels": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste d'étiquettes supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
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

