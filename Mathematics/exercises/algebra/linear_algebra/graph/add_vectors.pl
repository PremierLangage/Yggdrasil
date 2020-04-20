extends = /model/mathjsxgraph.pl

title = Affixe d'un nombre complexe

before ==
from jinja2 import Template
while True:
    ux,uy=list_randint(2,-5,5,[-1,0,1])
    vx,vy=list_randint(2,-5,5,[-1,0,1])
    wx,wy=ux+vx,uy+vy
    if abs(wx)<6 and abs(wy)<6 and (wx,wy)!=(0,0):
        break

jxg.script = Template(script).render(locals())
==

jxg.attributes %=
{
    "boundingbox": [
      -6,
      6,
      6,
      -6
    ],
    "showNavigation": false
  }
==

script ==
board.create('grid',[],{gridX:1,gridY:1});

var O = board.create('point',[0, 0],{visible:false});
var V = board.create('point',[ {{vx}} , {{vy}} ],{size:0,name:'v'});
var OV = board.create('arrow',[O, V]);
var U = board.create('point',[ {{ux}} , {{uy}} ],{size:0,name:'u'});
var OU = board.create('arrow',[O, U]);

var M = board.create('point',[0, 0],{name:'M',size:1,color:'none',withLabel:false});
var OM = board.create('arrow',[O, M],{color:'red',fixed:true});

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
On considère deux vecteurs u et v représentés graphiquement ci-dessous. On pose w=2u−12v. Cliquer à l'emplacement de l'extrémité du vecteur w. 
==

script_solution ==
board.create('point',[{{a}}, {{b}}],{size:2,name:'M',color:'green'});
board.create('point',[{{x}}, {{y}}],{size:2,name:'',color:'red'});
==

evaluator ==
x= jxg.points['M']['x']
y= jxg.points['M']['y']

from jinja2 import Template
from math import hypot
if hypot(x-wx, y-wy)<0.1:
     score=100
     #jxg.script = Template(script_solution).render(locals())
     #jxg.points = {}
     jxg.disabled = True
else:
     score=0
feedback=""
==


