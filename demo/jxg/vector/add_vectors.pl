extends = /model/jxg/vector.pl

title = Addition de vecteurs

before ==
from math import hypot

while True:
    u1x, u2x = [randint(-5, 0) for _ in range(2)]
    u1y, u2y = [randint(0, 5) for _ in range(2)]
    v1x, v2x = [randint(0, 5) for _ in range(2)]
    v1y, v2y = [randint(0, 5) for _ in range(2)]
    sol = [u2x - u1x + v2x - v1x, u2y - u1y + v2y - v1y]
    if hypot(*sol) < 7 and hypot(*sol) > 2:
        break
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
board.create('grid',[],{gridX:1,gridY:1});
var V1 = board.create('point',[ {{v1x}} , {{v1y}} ],{visible:false, name:'v1', fixed:true});
var V2 = board.create('point',[ {{v2x}} , {{v2y}} ],{size:0,name:'v', fixed:true});
var V = board.create('segment',[[ {{v1x}} , {{v1y}} ], [ {{v2x}} , {{v2y}} ]], {color:'orange', lastArrow: {type: 2, size: 6}});
var U1 = board.create('point',[ {{u1x}} , {{u1y}} ],{visible:false, name:'u1'});
var U2 = board.create('point',[ {{u2x}} , {{u2y}} ],{size:0,name:'u'});
var U = board.create('segment',[U1, U2], {color:'purple', lastArrow: {type: 2, size: 6}});

var pt1 = board.create('point', [-3, -3], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [-1, -3], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var vec = board.create('segment',[pt1, pt2],{color:'blue', lastArrow: {type: 2, size: 6}});
==

question ==
On considère deux vecteurs $! \vec{u} !$ et  $! \vec{v} !$ représentés graphiquement ci-dessous. Modifier le vecteur bleu de façon à ce qu'il représente le vecteur $! \vec{u} + \vec{v} !$ . 
==