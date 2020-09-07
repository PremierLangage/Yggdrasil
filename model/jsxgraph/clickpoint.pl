extends = /model/mathjsxgraph.pl

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

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});
==

evaluator ==
x, y = jxg.getpoint('M')
from math import hypot
if hypot(x-xsol, y-ysol) < 0.1:
    score = 100
    jxg.addscript(script_solution, globals())
else:
    score = 0
    jxg.addscript(script_solution, globals())
feedback = ""
==

