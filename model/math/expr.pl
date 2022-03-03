# Model for a single math input field
# with an evaluation as an expression

extends = /model/math/input.pl

# Specific keys

input_type = "expr"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []
equality = ""
modulo = 0

evalparam ==
from sympy import sympify
if modulo != 0:
    modulo = sympify(modulo)
input.evalparam = {'equality': equality, 'modulo': modulo, 'checkratsimp': checkratsimp, 'unauthorized_func': unauthorized_func, 'local_dict': sympify(symbol_dict)}
==

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
