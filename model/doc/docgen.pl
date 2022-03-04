@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
apidoc == #|json|
{
    "name": "poly",
    "keys": {
        "sol": {
            "type": "(Expr, Poly)",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Expr ou Poly."
        },
        "poly_form": {
            "type": "('', 'Expanded', 'Factorized')",
            "default": "''",
            "description": "Forme attendue de la réponse : pas de forme particulière (''), forme développée ('Expanded'), forme factorisée ('Factorized')."
        },
        "poly_domain": {
            "type": "('R', 'C')",
            "default": "'R'",
            "description": "Domaine du polynôme : réels ('R'), complexes ('C')."
        },
        "poly_var": {
            "type": "(str, None)",
            "default": "None",
            "description": "Variable du polynôme. Si cette clé vaut None, la variable est détectée automatiquement."
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

