# Model for a single math input field
# with an evaluation as a tuple
extends = /model/math/input0.pl

# Evaluation parameters
input_type = "tuple"
checksize = False
symbol_dict = {'e': E}

evalparam ==
from sympy import sympify
input.evalparam = {'checksize':checksize, 'local_dict': sympify(symbol_dict)}
==

# API documentation

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