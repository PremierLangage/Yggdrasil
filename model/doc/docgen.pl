@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

apidoc == #|json|
{
    "name": "complex",
    "keys": {
        "sol": {
            "type": "Complex",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Complex."
        },
        "complex_form": {
            "type": "('', 'Cartesian', 'Exponential')",
            "default": "''",
            "description": "Forme attendue de la réponse de l'élève : pas de forme particulière (''), forme cartésienne ('Cartesian'), forme exponentielle ('Exponential')."
        },
        "imaginary_unit": {
            "type": "str",
            "default": "'i'",
            "description": "Nom de l'unité imaginaire utilisée pour interpréter la réponse."
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

