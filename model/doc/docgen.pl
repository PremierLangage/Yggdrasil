@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

apidoc == #|json|
{
    "name": "matrix",
    "keys": {
        "sol": {
            "type": "Matrix",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Matrix."
        },
        "resizable": {
            "type": "bool",
            "default": "'False",
            "description": "Valeur indiquant si le champ de réponse est redimensionnable."
        },
        "initsize": {
            "type": "lst[int, int]",
            "default": "[2, 2]",
            "description": "Dimention initiale du champ de réponse. Cette clé n'est utile que si le champ de réponse est redimensionnable. Autrement, la dimension du champ de réponse matrice est automatiquement égale à la dimension de sol."
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

