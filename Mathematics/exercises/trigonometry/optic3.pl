extends =  /Mathematics/template/mathjsxgraph.pl

title = Point objet et point image en optique géométrique

lang = fr

before ==
f0=2
==

text ==
Essai
==

input.1.attributes = {boundingbox:[-9,4.5,9,-4.5],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var A=board.create('point',[-2,1],{name:"A",color:'red',fixed:false});
var C=board.create('point',[2,2],{name:"C",color:'red',fixed:false});
var l = board.create('segment',[[0,-2],[0,2]],{color:'gray', visible:false});
var B=board.create('glider',[0,1,l],{name:"B",color:'red',fixed:false});

var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
board.create('segment',[A,B],{size:0.5,color:'blue'});
board.create('segment',[B,C],{size:0.5,color:'blue'});
var foyer_objet = board.create('point',[-5,0],{name:"Foyer",color:'red',fixed:true});
==

input.1.style = width: 600px; height: 300px; margin: 0 auto;

evaluator ==
x=float(answer['M_x'])
y=float(answer['M_y'])
from math import atan2,pi
if abs((atan2(y,x)-valangle)%(2*pi))<0.1:
     score=100
else:
     score=0
feedback=""
==
