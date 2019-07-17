extends = /Mathematics/template/mathjsxgraph.pl

title = Module et argument

lang = fr

before ==
modulus=randint(1,3)
arg=pi*randitem([Rational(1,2),Rational(3,2)])
a=(modulus*cos(arg)).evalf()
b=(modulus*sin(arg)).evalf()
z=a+b*I
arg_tex=latex(arg)
==

text ==
Placer le point $% M %$ de module $% {{modulus}} %$ et d'argument $% {{arg_tex}} %$.
==

input.1.attributes = {boundingbox:[-3.5,3.5,3.5,-3.5],axis:true,grid:true,showNavigation:false}

input.1.script.main ==
JXG.Options.layer['point'] = 1;
board.create('grid',[],{gridX:0.25,gridY:0.25});
board.create('circle',[[0,0],1],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],2],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
board.create('circle',[[0,0],3],{strokeWidth:0.6,fixed:true,strokeColor:'gray'});
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

