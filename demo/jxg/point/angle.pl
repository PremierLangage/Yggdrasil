extends = /model/jxg/point.pl

before ==
angle = choice([pi/4, pi/2, 3*pi/4, pi, 3*pi/2])
sol = [cos(angle).evalf(), sin(angle).evalf()]
==

question ==
Placer le point M de sorte que l'angle $! (\overrightarrow{OA},\overrightarrow{OM}) !$ ait une mesure égale à $! \displaystyle {{ angle|latex }} !$. 
==

attributes = {"showNavigation": False, "boundingbox":[-1.25, 1.25, 1.25, -1.25]}

tol = 0.05

pointname = "M"

jxgscript == #|js|
var circle = board.create('circle', [[0, 0], [0, 1]], {strokeColor: 'blue', fixed: true});
var O = board.create('point', [0, 0], {size: 1, name: 'O', color: 'black', fixed: true});
var A = board.create('point', [1, 0], {size: 1, name: 'A', color: 'black', fixed: true});
var pt = board.create('glider', [1, 0.5, circle], {size: 2, name: 'M', color: 'blue', fixed: false});
var secOAM = board.create('sector', [O, A, pt], {color: 'orange'});
==