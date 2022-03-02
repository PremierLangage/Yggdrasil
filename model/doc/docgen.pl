@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "matchlist",
    "keys": {
        "matches": {
            "matches": "(str, list[tuple[str, str]]",
            "default": "[]",
            "description": "Liste des correspondances (source, cible). Elle peut être saisie comme une liste de couples ou comme une chaîne multilignes (chaque ligne correspondant à une correspondance, les deux éléments étant distingués par un séparateur défini dans la clé `separator`)."
        },
        "separator": {
            "type": "str",
            "default": "','",
            "description": "Séparateur des éléments d'une correspondance (source, cible)."
        },
        "nbmatches": {
            "type": "(int, None)",
            "default": "None",
            "description": "Nombre de correspondances à proposer parmi la liste de correspondances. Si cette clé vaut `None`, toutes les correspondances sont proposées."
        },
        "targets": {
            "type": "(str, list[str])",
            "default": "[]",
            "description": "Liste de cibles supplémentaires. Elle peut être saisie comme une liste ou comme une chaîne multilignes (chaque ligne correspondant à un item)."
        },
        "multiple": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si une cible peut être reliée à plusieurs sources."
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

