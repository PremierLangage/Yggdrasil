@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

apidoc == #|json|
{
    "name": "set",
    "keys": {
        "sol": {
            "type": "FiniteSet",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type FiniteSet."
        },
        "wobracket": {
            "type": "bool",
            "default": "'False",
            "description": "Valeur indiquant si l'ensemble doit être saisi entre accolades."
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

