# Model for a single math input field
# with an evaluation as a polynom

extends = /model/math/input.pl

# Evaluation parameters
input_type = "poly"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
poly_form =
poly_domain = R

evalparam ==
from sympy import poly
poly_var = str(poly(sol).gen)
input.evalparam = {'var': poly_var, 'form': poly_form}
==

# API documentation

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