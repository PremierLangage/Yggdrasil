extends = /model/mathjsxgraph.pl

ptname = M

tol = 0.1

jxg.attributes % {"showNavigation":false, "boundingbox":[-1,1,5,-1]}

script_init ==
board.create('grid', [], {gridX: 0.25, gridY: 0.25});
board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point', [0,0],{size:1, name: 'O', color: 'black', fixed: true});
var A = board.create('point', [1,0],{size:1, name: 'A', color: 'black', fixed: true});
var M = board.create('glider', [1, 0.5, circle],{name:'M',color:'blue',fixed:false});
board.create('sector', [O, A, M], {color: 'orange'});
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

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{size:2,name:'',color:'green'});
==

inputblock ==
<div class="img img-60">
{{ jxg|component }}
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

