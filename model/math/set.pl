# Model for a single math input field
# with an evaluation as a finite set

extends = /model/math/input0.pl

# Specific keys

wobracket = False

input_type = "set"
checkratsimp = True
symbol_dict = {'e': E}

evalparam ==
from sympy import sympify
input.evalparam = {'wobracket': wobracket, 'checkratsimp': checkratsimp, 'local_dict': sympify(symbol_dict)}
==

# API documentation

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
            "type": "bool",
            "default": "'False",
            "description": "Valeur indiquant si l'ensemble doit être saisi entre accolades."
        }
    }
}
==