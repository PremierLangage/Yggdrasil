@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Bug JSXGraph

before =

drawer =: MathDrawer

drawer.attributes %=
{
    "boundingbox": [
      -4,
      4,
      4,
      -4
    ],
    "showNavigation": false
  }
==

drawer.script ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'red',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

text=

form==
<center>
{{ drawer|component }}
</center>
==


evaluator ==
x=float(drawer.points['M']['x'])
y=float(drawer.points['M']['y'])
from math import atan2,pi
if abs((atan2(y,x)-angle)%(2*pi))<0.1:
     score=100
else:
     score=0
feedback=""
==

