extends = /Mathematics/template/mathexpr.pl
extends = /Mathematics/template/mathjsxgraph.pl

title = Lire un angle sur le cercle trigonométrique

param.lstangle = [pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4]

before ==
lstangle=eval(param['lstangle'])
angle=randitem(lstangle)
cosangle=cos(angle).evalf()
sinangle=sin(angle).evalf()
xM=float(cosangle)
yM=float(sinangle)

jxg.setscript(script, globals())
==

drawer.attributes %=
{
    "boundingbox": [
      -1.25,
      1.25,
      1.25,
      -1.25
    ],
    "showNavigation": false,
    "axis": false,
    "grid": false
  }
==

script ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('point',[ %s , %s ],{size:1,name:'M',color:'black',fixed:true});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==






