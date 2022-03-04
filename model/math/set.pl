# Model for a single math input field
# with an evaluation as a finite set

extends = /model/math/input.pl

# Specific keys

wobracket = False

input_type = "set"
checkratsimp = True
symbol_dict = {'e': E}

evalparam ==
from sympy import sympify
input.evalparam = {'wobracket': wobracket, 'checkratsimp': checkratsimp, 'local_dict': sympify(symbol_dict)}
==

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
            "type": "('', 'UpToConstant', 'Modulo')",
            "default": "'False",
            "description": "Type d'égalitée utilisé : égalité stricte (''), égalité à une constante près ('UpToConstant'), égalité modulo un nombre ('Modulo')."
        }
    }
}
==