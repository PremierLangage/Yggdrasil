extends = /model/jxg/point.pl

title = Addition de vecteurs

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

script ==
board.create('grid',[],{gridX:1,gridY:1});

var O = board.create('point',[0, 0],{visible:false});
var V = board.create('point',[ {{vx}} , {{vy}} ],{size:0,name:'v'});
var OV = board.create('arrow',[O, V]);
var U = board.create('point',[ {{ux}} , {{uy}} ],{size:0,name:'u'});
var OU = board.create('arrow',[O, U]);

var p = board.create('point',[0, 0],{name:'M',size:1,color:'none',withLabel:false});
var OM = board.create('arrow',[O, M],{color:'red',fixed:true});
==


question ==
On considère deux vecteurs u et v représentés graphiquement ci-dessous. On pose w=2u−12v. Cliquer à l'emplacement de l'extrémité du vecteur w. 
==


