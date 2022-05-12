# Model for an exercise with a single math input field and a custom evaluation.

extends = /model/math/input0.pl

eval_scripts = ["mathimport", "evalparam", "getinput", "evaluator", "ending"]

evaluator ==
#
==

ending ==
input.score = score
input.feedback = feedback
input.display_feedback()
if score >= 0:
  input.disable()
from jinja_env import Env
inputblock = Env.from_string(_tpl_['inputblock']).render(globals())
==

solution ==
==

apidoc == #|json|
{
    "name": "input_eval",
    "keys": {
        "evaluator": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant d'évaluer la réponse de l'exercice."
        },
        "score": {
            "type": "int",
            "default": "",
            "description": "Score de l'exercice. Il doit être produit par le script evaluator."
        },
        "feedback": {
            "type": "str",
            "default": "",
            "description": "Message d'avertissement ou d'erreur. Il doit être produit par le script evaluator."
        }
    }
}
==