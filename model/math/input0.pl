extends = /model/basic/hackpage.pl
extends = messages_math.pl

@ /utils/std/plrandom.py
@ /utils/std/plcsv.py

@ /builder/before3.py [builder.py]
@ /grader/evaluator3.py [grader.py]
@ /utils/inputfields/basicinput.py
@ /utils/inputfields/mathinput.py
@ /utils/inputfields/jxginput.py
@ /utils/jinja/mathjinja.py  [jinja_env.py]
@ /utils/json/mathjson.py [json_encoder.py]
@ /utils/json/serializable.py


@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/graphics/plmpl.py

@ /utils/components/mathinput/mathinput.html


# Specific keys


keypad = []

embed = ""

prefix = Réponse :

latexsettings.ln_notation = True
latexsettings.inv_trig_style = "full"


input_type = "expr"

mathimport == #|py|
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln, atan, acos, asin
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, factor, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval, Matrix
from sympy import Sum, Limit
from sympy import diff, integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import CustomLatexPrinter
latex = CustomLatexPrinter(latexsettings).doprint
from latex2sympy import latex2sympy
from randsympy import randpoly
from randsympy import randmat, randmat_invertible, randmat_fullrank, randmat_givenrank
==

style.basic =@ /model/css/basic.css.html
style.mathquill =@ /utils/components/mathinput/mathinput.css.html

jinja_keys = ["prefix", "question", "solution", "inputblock"]
before_scripts = ["mathimport", "init_input", "before", "process"]
eval_scripts = ["evalparam", "getinput", "evaluator"]



title = Title

init_input ==
from mathinput import MathInput
input = MathInput()
input.value = ""
input.type = input_type
==

process ==
from jinja_env import Env
embed = Env.from_string(embed).render(locals())
input.set_embed(embed)
input.set_keypad(keypad)
_tpl_ = {'inputblock': inputblock}
==

before ==
sol = 0
==

solution ==
<div style="display: block">
{{ prefix }} 
$! {{ sol|latex }} !$
</div>
==

evalparam ==

==

getinput == #|py|
from mathinput import MathInput
MathInput.message = message
input.value = answers[input.id]
==

evaluator ==
input.sol = sol
score = input.eval()
input.display_feedback()
if score >= 0:
  input.disable()
from jinja_env import Env
inputblock = Env.from_string(_tpl_['inputblock']).render(globals())
==


tplpage =@ /model/tplpage/basicmath.html


inputblock == #|html|
<div style="display: block; margin-top: 1em;">
{{ prefix }}
{{ input|html }}
</div>
==

javascript.onbeforesubmit == #|js|
<script>
// Fonction appelée quand l'exercice est soumis (bouton valider).
function onBeforeSubmitPL() {
  // Copie les valeurs des champs MathField dans des éléments input.

    if (typeof setOfMathFields != "undefined") {

    Object.values(setOfMathFields).forEach(function(mathField) {
    var mathFieldInput = document.getElementById('form_'+mathField.el().id);
    mathFieldInput.value = mathField.latex();
    });

    };

    if (typeof setOfStaticMaths != "undefined") {
 
    Object.values(setOfStaticMaths).forEach(function(mathField) {
    var mathFieldInput = document.getElementById('form_'+mathField.el().id);
      if (mathField.innerFields.length == 1) {
      mathFieldInput.value = mathField.innerFields[0].latex();
        } else {
      mathFieldInput.value = [mathField.innerFields[0].latex(),mathField.innerFields[1].latex()];
      }
    });

    };

  // Cache les popovers avant que les éléments correspondants soient détruits du DOM.
  $(function () {
    $('[data-toggle="popover"]').popover('hide')
  });

  return true;
}
</script>
==

text =
form = 


apidoc == #|json|
{
    "name": "input",
    "keys": {
        "before": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant de générer les clés de l'exercice."
        },
        "title": {
            "type": "str",
            "default": "",
            "description": "Titre de l'exercice."
        },
        "question": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant l'énoncé de l'exercice."
        },
        "inputblock": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant l'énoncé de l'exercice."
        },
        "solution": {
            "type": "str",
            "default": "",
            "description": "Template HTML contenant la correction de l'exercice."
        },
        "evaluator": {
            "type": "str",
            "default": "",
            "description": "Script Python permettant d'évaluer la réponse de l'exercice."
        },
        "keypad": {
            "type": "list",
            "default": "[]",
            "description": "Liste des boutons du clavier virtuel attaché au champ de réponse."
        },
        "embed": {
            "type": "str",
            "default": "''",
            "description": "Formule dans laquelle est insérée le champ de réponse."
        },
        "checkratsimp": {
            "type": "bool",
            "default": "True",
            "description": "Valeur indiquant si l'évaluation vérifie que les valeurs rationnelles sont simplifiées dans la réponse saisie."
        },
        "symbol_dict": {
            "type": "dict",
            "default": "{'e': E}",
            "description": "Dictionnaire des symboles utilisés pour convertir la réponse saisie en expression SymPy."
        },
        "unauthorized_func": {
            "type": "list[str]",
            "default": "[]",
            "description": "Liste des fonctions non autorisées."
        },
        "latexsettings": {
            "type": "dict",
            "default": "{}",
            "description": "Dictionnaire des paramètres de conversion SymPy vers LaTeX."
        }
    }
}
==

