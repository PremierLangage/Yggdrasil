extends = /model/jxg/vector.pl

before ==
sol = sampleint(-5, 5, 2)
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
var pt1 = board.create('point', [-2, -2], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var vec = board.create('segment', [pt1, pt2], {color:'blue', lastArrow: {type: 2, size: 6}});
==

question ==
Modifier le vecteur ci-dessous pour en faire un vecteur de coordonnées $! ( {{ sol[0] }}, {{ sol[1] }} ) !$. 
==