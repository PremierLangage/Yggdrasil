@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "expr",
    "keys": {
        "sol": {
            "type": "Expr",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Expr."
        },
        "equality": {
            "type": "('', 'UpToConstant', 'Modulo')",
            "default": "''",
            "description": "Type d'égalitée utilisé : égalité stricte (''), égalité à une constante près ('UpToConstant'), égalité modulo un nombre ('Modulo')."
        },
        "modulo": {
            "type": "(int, float)",
            "default": "0",
            "description": "Nombre utilisé dans le cas d'une égalité modulo un nombre."
        }
    }
}
==

before== #|python|
doc = eval(apidoc)
from jinja2 import Environment, BaseLoader, contextfilter, Template
Env = Environment(loader=BaseLoader())
text = "{% raw %}\n" + Env.from_string(text).render({'doc': doc}) + "{% endraw %}"
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

