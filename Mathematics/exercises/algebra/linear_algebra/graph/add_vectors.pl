extends = /model/jxg/point.pl

title = Addition de vecteurs

before ==
while True:
    ux = randint(-5,5,[-1,0,1])
    uy = randint(-5,5,[-1,0,1])
    vx = randint(-5,5,[-1,0,1])
    vy = randint(-5,5,[-1,0,1])
    xsol,ysol=ux+vx,uy+vy
    if abs(xsol)<6 and abs(ysol)<6 and (xsol,ysol)!=(0,0):
        break
==

jxgscript ==
board.create('grid',[],{gridX:1,gridY:1});
var O = board.create('point',[0, 0],{visible:false, fixed:true});
var V = board.create('point',[ {{vx}} , {{vy}} ],{size:0,name:'v', fixed:true});
var OV = board.create('arrow',[O, V], {color:'orange'});
var U = board.create('point',[ {{ux}} , {{uy}} ],{size:0,name:'u', fixed:true});
var OU = board.create('arrow',[O, U], {color:'green'});

var psol = board.create('point',[0, 0],{name:'M',size:1,color:'none',withLabel:false});
var OM = board.create('arrow',[O, psol],{color:'red',fixed:true});
==


question ==
On considère deux vecteurs u et v représentés graphiquement ci-dessous. On pose w=2u−12v. Cliquer à l'emplacement de l'extrémité du vecteur w. 
==


