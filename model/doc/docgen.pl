@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "interval",
    "keys": {
        "sol": {
            "type": "(Interval, Union)",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Interval ou Union."
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

