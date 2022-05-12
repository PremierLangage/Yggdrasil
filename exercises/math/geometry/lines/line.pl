extends = /model/jxg/line.pl

title = Tracer un vecteur


before ==
a=randint(-4,4,[0])
b=randint(-4,4,[0])
x=symbols('x')
f=a*x+b

sol = [[0,b], [a+b, b]]
==


text ==
Tracer la droite d'équation $! y = {{f|latex}} !$.
==


attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
var pt1 = board.create('point', [-2, -2], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var line = board.create('line', [pt1, pt2], {color:'blue'});
==

question ==
Modifier le vecteur ci-dessous pour en faire un vecteur de coordonnées $! ( {{ sol[0] }}, {{ sol[1] }} ) !$. 
==
