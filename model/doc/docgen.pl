@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# API documentation
apidoc == #|json|
{
    "name": "AMC_TXT",
    "keys": {
        "title": {
            "type": "str",
            "default": "''",
            "description": "Titre du quiz."
        },
        "intro": {
            "type": "str",
            "default": "''",
            "description": "Texte d'introduction du quiz."
        },
        "quiz": {
            "type": "str",
            "default": "''",
            "description": "Questions du quiz au format AMC-TXT."
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

