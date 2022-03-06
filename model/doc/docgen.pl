@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# API documentation

apidoc == #|json|
{
    "name": "input",
    "keys": {
        "before": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant de générer les clés de l'exercice."
        },
        "title": {
            "type": "str",
            "default": "",
            "description": "Titre de l'exercice."
        },
        "question": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant l'énoncé de l'exercice."
        },
        "inputblock": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant l'énoncé de l'exercice."
        },
        "solution": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant la correction de l'exercice."
        },
        "evaluator": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant d'évaluer la réponse de l'exercice."
        },
        "keypad": {
            "type": "list",
            "default": "[]",
            "description": "Liste des boutons du clavier virtuel attaché au champ de réponse."
        },
        "embed": {
            "type": "str",
            "default": "''",
            "description": "Formule dans laquelle est insérée le champ de réponse."
        },
        "checkratsimp": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si l'évaluation vérifie que les valeurs rationnelles sont simplifiées dans la réponse saisie."
        },
        "symbol_dict": {
            "type": "dict",
            "default": "{'e': E}",
            "description": "Dictionnaire des symboles utilisés pour convertir la réponse saisie en expression SymPy."
        },
        "unauthorized_func": {
            "type": "list[str]",
            "default": "[]",
            "description": "Liste des fonctions non autorisées."
        },
        "latexsettings": {
            "type": "dict",
            "default": "{}",
            "description": "Dictionnaire des paramètres de conversion SymPy vers LaTeX."
        }
    }
}
==

before== #|python|
doc = eval(apidoc)
from jinja2 import Environment, BaseLoader, contextfilter, Template
Env = Environment(loader=BaseLoader())
text = Env.from_string(text).render({'doc': doc})
==

evaluator== #|python|
grade = (100, 'OK')
==

#! linter:require:a
form =

title=


text =@ template.html

