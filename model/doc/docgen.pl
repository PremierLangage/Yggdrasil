@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# API documentation
apidoc == #|json|
{
    "name": "input_eval",
    "keys": {
        "evaluator": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant d'évaluer la réponse de l'exercice."
        },
        "score": {
            "type": "int",
            "default": "",
            "description": "Score de l'exercice. Il doit être produit par le script evaluator."
        },
        "feedback": {
            "type": "str",
            "default": "",
            "description": "Message d'avertissement ou d'erreur.. Il doit être produit par le script evaluator."
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

