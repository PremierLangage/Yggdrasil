extends = /model/jxg/input0.pl

# Specific keys

pointname = ""

tol = 0.05

# Question and input block

question ==
==

# Before scripts


initinput ==
from jxginput import JXGPoint
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