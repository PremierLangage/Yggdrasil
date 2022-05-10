extends = /model/jxg/point.pl

title = Placer un angle

attributes = {"showNavigation":False, "boundingbox":[-1.25,1.25,1.25,-1.25]}

tol = 0.01

pointname = "M"

param.angles = "pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4, 2*pi"

before ==
lstangle = sympify(param['angles'])
angle = choice(lstangle)
valangle = float(angle.evalf())
xsol = float(cos(valangle))
ysol = float(sin(valangle))
sol = [xsol, ysol]
==


name = "M"

jxgscript ==
board.create('grid', [], {gridX: 0.25, gridY: 0.25});
board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point', [0,0],{size:1, name: 'O', color: 'black', fixed: true});
var A = board.create('point', [1,0],{size:1, name: 'A', color: 'black', fixed: true});
var pt = board.create('glider', [1, 0.5, circle],{name:'M',color:'blue',fixed:false});
board.create('sector', [O, A, pt], {color: 'orange'});
==

question ==
Placer sur le cercle unité ci-dessous le point M de sorte que l'angle $! (\overrightarrow{OA},\overrightarrow{OM}) !$ ait une mesure égale à $! {{ angle|latex }} !$. 
==
