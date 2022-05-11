extends = /model/jxg/line.pl

title = Tracer un vecteur

before ==
sol = [[0,1], [3, 4]]
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
var pt1 = board.create('point', [-2, -2], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var line = board.create('line', [pt1, pt2], {color:'blue', lastArrow: {type: 2, size: 6}});
==

question ==
Modifier le vecteur ci-dessous pour en faire un vecteur de coordonnées $! ( {{ sol[0] }}, {{ sol[1] }} ) !$. 
==
