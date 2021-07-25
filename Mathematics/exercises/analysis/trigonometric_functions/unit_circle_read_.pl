extends = /model/jsxgraph/expr.pl

param.lstangle = [pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4]

before ==
lstangle=eval(param['lstangle'])
angle=choice(lstangle)
cosangle=cos(angle).evalf()
sinangle=sin(angle).evalf()
xM=float(cosangle)
yM=float(sinangle)
jxg.setscript(script, globals())
==

# jxg.attributes % {"boundingbox": [-1.25, 1.25, 1.25, -1.25], "showNavigation": false, "axis": false, "grid": false}

# jinja_keys % ["question", "script", "text", "inputblock", "solution", "prefix"]


script ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
==







