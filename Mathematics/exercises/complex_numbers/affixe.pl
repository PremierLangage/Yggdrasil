extends = /Mathematics/template/mathjsxgraph.pl

title = Affixe d'un nombre complexe

lang = fr

before ==
a=randint(-5,5)
b=randint(-5,5)
z=a+b*sp.I
latexz=latex(z)
==

text ==
Placer le point $% M %$ d'affixe $%{{ latexz }}%$ dans le plan ci-dessous.
==

input.1.attributes = {boundingbox:[-6,6,6,-6],axis:true,grid:true,showNavigation:false}

input.1.script.main ==
board.create('grid',[],{gridX:1,gridY:1});
board.create('axis',[[0,0],[1,0]],{name:'Re',withLabel:true,label:{position:'urt',offset:[-5,10]},ticks:{visible: false}});
board.create('axis',[[0,0],[0,1]],{name:'Im',withLabel:true,label:{position:'urt',offset:[10,0]},ticks:{visible: false}});
var M = board.create('point',[0,0],{size:2,name:'M',color:'red'});

function getMouseCoords(e) {
    var cPos = board.getCoordsTopLeftCorner(e);
    var absPos = JXG.getPosition(e);
    var dx = absPos[0]-cPos[0];
    var dy = absPos[1]-cPos[1];
    return new JXG.Coords(JXG.COORDS_BY_SCREEN, [dx, dy], board);
}

function down(e) {
    coords = getMouseCoords(e);
    M.setPosition(JXG.COORDS_BY_USER,[coords.usrCoords[1], coords.usrCoords[2]]);
}

board.on('down',down)
==

input.1.script.solution ==
var Msol = board.create('point',[{{a}},{{b}}],{size:2,name:'M',color:'green'});
==

evaluator ==
x=float(answer['M_x'])
y=float(answer['M_y'])
from math import hypot
if hypot(x-a, y-b)<0.1:
     score=100
else:
     score=0
feedback=""
==




