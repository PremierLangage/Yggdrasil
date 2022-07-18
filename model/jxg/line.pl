extends = /model/jxg/input0.pl

# Specific keys

attributes = {}

jxgscript ==
==

pointnames = ["A", "B"]

tol = 0.05

# Question and input block

question ==
==


# Before scripts


initinput ==
from jxginput import JXGLine
input = JXGLine()
==


process ==
input.set_attributes(attributes)
input.evalparam = {'tol': float(tol)}
input.pointnames = pointnames
input.set_script(jxgscript, globals())
==


apidoc == #|json|
{
    "name": "textinput",
    "keys": {
        "sol": {
            "type": "lst[float, float]",
            "default": "",
            "description": "Coordonnées du vecteur solution."
        },
        "attributes": {
            "type": "dict",
            "default": "{}",
            "description": "Paramètres du panneau graphiqe interactif."
        },
        "jxgscript": {
            "type": "str",
            "default": "",
            "description": "Script JSXGraph."
        },
        "pointnames": {
            "type": "lst[str, str]",
            "default": "",
            "description": "Noms des points extrémités du vecteur à construire."
        }
        "tol": {
            "type": "float",
            "default": "0.1",
            "description": "Erreur maximum (en norme euclidienne) pour considérer une réponse comme correcte."
        }

    }
}
==