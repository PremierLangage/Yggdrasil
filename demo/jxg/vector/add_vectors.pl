extends = /model/jxg/vector.pl

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

sol = [1, 2]
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}


jxgscript ==
board.create('grid',[],{gridX:1,gridY:1});
var V1 = board.create('point',[0, 0],{visible:false, fixed:true});
var V2 = board.create('point',[ {{vx}} , {{vy}} ],{size:0,name:'v', fixed:true});
var V = board.create('arrow',[O, V], {color:'orange'});
var U1 = board.create('point',[0, 0],{visible:false, fixed:true});
var U2 = board.create('point',[ {{ux}} , {{uy}} ],{size:0,name:'u', fixed:true});
var U = board.create('arrow',[O, U], {color:'purple'});

var pt1 = board.create('point', [0, 0], {visible: true, name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [1, 1], {visible: true, name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var vec = board.create('segment',[pt1, pt2],{color:'blue', lastArrow: {type: 2, size: 6}});
==


question ==
On considère deux vecteurs u et v représentés graphiquement ci-dessous. On pose w=2u−12v. Cliquer à l'emplacement de l'extrémité du vecteur w. 
==


