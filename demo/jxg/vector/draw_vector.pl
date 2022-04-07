extends = /model/jxg/vector.pl

title = Addition de vecteurs

before ==
sol = sampleint(-5, 5, 2)
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
var pt1 = board.create('point', [-2, 2], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var vec = board.create('segment',[pt1, pt2],{color:'blue', lastArrow: {type: 2, size: 6}});
==

question ==
On considère deux vecteurs $! \vec{u} !$ et  $! \vec{v} !$ représentés graphiquement ci-dessous. Modifier le vecteur bleu de façon à ce qu'il représente le vecteur $! \vec{u} + \vec{v} !$ . 
==
