extends = /model/math/input.pl

# Evaluation parameters
input_type = "interval"
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = []


evalparam ==
input.evalparam = {}
==

latexsettings.ln_notation = True

# API documentation

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