# Model for a single math input field
# with an evaluation as a complex number

extends = /model/math/input.pl

# Evaluation parameters
input_type = "complex"
input_prefix = Réponse :
imaginary_unit = i
complex_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

# Latex settings
latexsettings.imaginary_unit = i

evalparam ==
from sympy import sympify
input.evalparam = {'imaginary_unit': imaginary_unit, 'form': complex_form, 'checkratsimp': checkratsimp, 'unauthorized_func': unauthorized_func, 'local_dict': sympify(symbol_dict)}
==

apidoc == #|json|
{
    "name": "complex",
    "keys": {
        "sol": {
            "type": "Complex",
            "default": "",
            "description": "Bonne réponse. Elle doit être définie dans le script `before` comme un objet SymPy de type Complex."
        },
        "complex_form": {
            "type": "('', 'Cartesian', 'Exponential')",
            "default": "''",
            "description": "Forme attendue de la réponse de l'élève : pas de forme particulière (''), forme cartésienne ('Cartesian'), forme exponentielle ('Exponential')."
        },
        "imaginary_unit": {
            "type": "str",
            "default": "'i'",
            "description": "Nom de l'unité imaginaire utilisée pour interpréter la réponse."
        }
    }
}
==
