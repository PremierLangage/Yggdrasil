extends = /model/jxg/line.pl

title = Droite

before ==
a = choice([-1, 1])*choice([1, 2, 3, Rational(1,2), Rational(1,3), Rational(3,2)])
b = randint(-3, 3,[0])
var('x')
f = a*x+b
sol = [[0,b], [1, a+b]]
==


question ==
Tracer la droite d'équation $! y = {{f|latex}} !$.
==


attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

jxgscript == #|js|
var pt1 = board.create('point', [-2, -2], {color:'blue', name: 'A', size: 0.5, withLabel: false});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false});
var line = board.create('line', [pt1, pt2], {color:'blue'});
==

tol = 0.15

