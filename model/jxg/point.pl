extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl

# Specific keys

pointname = "M"

tol = 0.05

attributes = {"showNavigation":False, "boundingbox":[-1.25,1.25,1.25,-1.25]}

question ==
==

inputblock ==
{{ input|component }}
==

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
from jxginput import JXGInput
input = JXGInput()
==



process ==
input.attributes = attributes
input.sol = [xsol, ysol]
input.evalparam = {'tol': tol}
input.set_script(script_init + script_aux, globals())
==


script_init ==
board.create('line', [[0,0],[1,2]]);
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
    M.setPosition(JXG.COORDS_BY_USER,[coords.usrCoords[1], coords.usrCoords[2]]);
}

board.on('down', down)
==

tplpage =@ /model/tplpage/basicmath.html

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});
==

evaluator ==
score = input.eval()
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