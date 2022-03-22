extends = /model/jxg/vector.pl

title = Addition de vecteurs

before ==
from math import hypoth

while True:
    u1x, u1y, u2x, u2y = [randint(0, 5) for _ in range(4)]
    v1x, v1y, v2x, v2y = [randint(0, 5) for _ in range(4)]
    sol = [u2x - u1x + v2x - v1x, u2y - u1y + v2y - v1y]
    if hypot(*sol) < 7 and hypot(*sol) > 2:
        break

sol = [ux + vx, uy + vy]
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}


jxgscript ==
board.create('grid',[],{gridX:1,gridY:1});
var V1 = board.create('point',[0, 0],{visible:false, name:'v1'});
var V2 = board.create('point',[ {{vx}} , {{vy}} ],{size:0,name:'v'});
var V = board.create('arrow',[V1, V2], {color:'orange'});
var U1 = board.create('point',[0, 0],{visible:false, name:'u1'});
var U2 = board.create('point',[ {{ux}} , {{uy}} ],{size:0,name:'u'});
var U = board.create('arrow',[U1, U2], {color:'purple'});

var pt1 = board.create('point', [0, 0], {visible: true, name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [1, 1], {visible: true, name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var vec = board.create('segment',[pt1, pt2],{color:'blue', lastArrow: {type: 2, size: 6}});
==


question ==
On considère deux vecteurs u et v représentés graphiquement ci-dessous. On pose w=2u−12v. Cliquer à l'emplacement de l'extrémité du vecteur w. 
==


