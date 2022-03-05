extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl

ptname = M

tol = 0.05


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

before ==
lstangle = [pi/4,pi/2]
angle = choice(lstangle)
valangle = float(angle.evalf())
xsol = float(cos(valangle))
ysol = float(sin(valangle))
==

process ==
input.attributes = attributes
input.set_script(script_init)
==

attributes = {} 

#{"showNavigation":false, "boundingbox":[-1.25,1.25,1.25,-1.25]}

ptname = M

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

inputblock ==
<div style="width:500px; height:500px;">
{{ input|component }}
</div>
==

evaluator ==
x, y = jxg.getpoint(ptname)
from math import hypot
if hypot(x-xsol, y-ysol) < tol:
    score = 100
    jxg.addscript(script_solution, globals())
else:
    score = 0
    jxg.addscript(script_solution, globals())
feedback = ""
==

