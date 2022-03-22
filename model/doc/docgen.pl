@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# API documentation

apidoc == #|json|
{
    "name": "textinput",
    "keys": {
        "sol": {
            "type": "lst[float, float]",
            "default": "",
            "description": "Coordonnées point solution."
        },
        "attributes": {
            "type": "dict",
            "default": "{}",
            "description": "Paramètres du panneau graphiqe interactif."
        },
        "jxgscript": {
            "type": "str",
            "default": "",
            "description": "Script JSXGraph."
        },
        "pointname": {
            "type": "str",
            "default": "",
            "description": "Nom du point à placer."
        },
        "tol": {
            "type": "float",
            "default": "0.1",
            "description": "Erreur maximum (en distance euclidienne) pour considérer une réponse comme correcte."
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

