@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

apidoc == #|json|
{
    "name": "tuple",
    "keys": {
        "sol": {
            "type": "(list, tuple, Tuple",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme une liste/tuple d'objets SymPy ou un objet SymPy de type Tuple."
        },
        "checksize": {
            "type": "bool",
            "default": "'False",
            "description": "Valeur indiquant si une réponse de taille incorrecte déclenche un avertissement."
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

