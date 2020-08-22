# Author : D. Doyen
# Tags : complex numbers
# 19/8/2020

extends = /model/mathjsxgraph.pl

title = Affixe d'un nombre complexe

before ==
a = randint(-5, 5, [0])
b = randint(-5, 5, [0])
z = a + b*I
jxg.setscript(script_init)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}


script_init ==
board.create('grid',[],{gridX:1,gridY:1});
board.create('axis',[[0,0],[1,0]],{name:'Re',withLabel:true,label:{position:'urt',offset:[-5,10]},ticks:{visible: false}});
board.create('axis',[[0,0],[0,1]],{name:'Im',withLabel:true,label:{position:'urt',offset:[10,0]},ticks:{visible: false}});
const M = board.create('point',[0, 0],{size:2,name:'M',color:'red'});

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


text ==
Placer le point $% M %$ d'affixe $%{{ z|latex }}%$ dans le plan ci-dessous.
==

script_solution ==
board.create('point',[{{a}}, {{b}}],{size:2,name:'',color:'green'});
// board.create('point',[{{x}}, {{y}}],{size:2,name:'',color:'red'});
==

evaluator ==
x, y = jxg.getpoint('M')
from math import hypot
if hypot(x-a, y-b) < 0.1:
    score = 100
    jxg.addscript(script_solution, globals())
else:
    score = 0
    jxg.addscript(script_solution, globals())
feedback=""
==

old ==
x= drawer.points['M']['x']
y= drawer.points['M']['y']

from jinja2 import Template
from math import hypot
if hypot(x-a, y-b)<0.1:
     score=100
     drawer.script = Template(script_solution).render(locals())
     drawer.points = {}
     drawer.disabled = True
else:
     score=0
     if nbattempt + 1 >= int(maxattempt):
        drawer.script = Template(script_solution).render(locals())
        drawer.points = {}
        drawer.disabled = True
feedback=""
==










