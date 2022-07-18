extends = /model/basic/hackpage.pl

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

attributes = {}

jxgscript ==
==

pointname = ""

tol = 0.05

# Question and input block

question ==
==

inputblock ==
{{ input|html }}
==

jinja_keys = ["question", "solution", "inputblock"]


# Before scripts

before_scripts = ["mathimport", "initinput", "before", "process"]

mathimport ==
from sympy import E, I, pi, oo
from sympy import sqrt, Abs, sin, cos, tan, exp, ln
from sympy import Symbol, symbols, var
from sympy import sympify, simplify, Lambda
from sympy import Integer, Rational, Poly, FiniteSet, Tuple, Interval
from sympy import integrate
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from sympy2latex import latex
from latex2sympy import latex2sympy
==

initinput ==
from jxgpoint import JXGPoint
input = JXGPoint()
==


process ==
input.set_attributes(attributes)
input.evalparam = {'tol': tol}
input.pointname = pointname
input.set_script(jxgscript + script_aux, globals())
==

script_aux ==
function getMouseCoords(e) {
    let cPos = board.getCoordsTopLeftCorner(e);
    let absPos = JXG.getPosition(e);
    let dx = absPos[0]-cPos[0];
    let dy = absPos[1]-cPos[1];
    return new JXG.Coords(JXG.COORDS_BY_SCREEN, [dx, dy], board);
}

function down(e) {
    let coords = getMouseCoords(e);
    pt.setPosition(JXG.COORDS_BY_USER,[coords.usrCoords[1], coords.usrCoords[2]]);
}

board.on('down', down)
==

tplpage =@ /model/tplpage/basicmath.html

evaluator ==
input.sol = sol
score = input.eval()
input.display_feedback()
input.disable()
==




style.jxgcss ==
<style>
.jsxgraph-component {
    width: 400px;
    height: 400px;
    margin: 0 auto;
    border: 1px solid;
}
</style>
==

# API documentation

apidoc == #|json|
{
    "name": "textinput",
    "keys": {
        "sol": {
            "type": "lst[float, float]",
            "default": "",
            "description": "Coordonnées point solution."
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
        "pointname": {
            "type": "str",
            "default": "",
            "description": "Nom du point à placer."
        },
        "tol": {
            "type": "float",
            "default": "0.1",
            "description": "Erreur maximum (en distance euclidienne) pour considérer une réponse comme correcte."
        }

    }
}
==