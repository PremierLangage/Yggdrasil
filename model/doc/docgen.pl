@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "numinput",
    "keys": {
        "sol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Bonne réponse."
        },
        "diffmeasure": {
            "type": "('AbsError', 'RelError')",
            "default": "'AbsError'",
            "description": "Mesure utilisée pour calculer l'écart entre la réponse saisie et la réponse acceptée."
        },
        "tol": {
            "type": "(int, float)",
            "default": "0",
            "description": "Ecart maximum (par rapport à la mesure définie dans `diffmeasure`) pour considérer une réponse comme correcte."
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
doc = eval(apidoc)
from jinja2 import Environment, BaseLoader, contextfilter, Template
Env = Environment(loader=BaseLoader())
text = Env.from_string(text).render({'doc': doc})
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

