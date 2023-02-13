extends = /Mathematics/template/mathjsxgraph.pl

title = Représentation 

lang = fr

before ==
a=randint(-5,5,[0])
r=randint(2,5)

==

text ==
Représenter l'ensemble des nombres réels tels que $% | x - {{a}} | \leq {{r}} %$ sur la droite graduée ci-dessous.
==

input.1.attributes = {boundingbox:[-12,3,12,-3],axis:false,grid:false,showNavigation:false}
input.1.style = max-width:400px;width:80vw;max-height:100px;height:20vw;margin: 0 auto;

input.1.script.main ==
var axisx = board.create('axis', [[0,0], [1,0]], 
  {
    ticks: {
      drawZero: true,
      ticksDistance: 5,
      insertTicks: false,
      strokeOpacity:1,
      majorHeight: 35,
      minorHeight: 10,
      minorTicks: 4,
      label : { offset:[3,-15]}
    }
  });
var M1 = board.create('glider', [-1,0, axisx], {size:0.8,color:'blue',name:''});
var M2 = board.create('glider', [1,0, axisx], {size:0.8,color:'blue',name:''});
board.create('segment',[M1,M2],{color:'blue'});
board.create('point', [{{a}},0], {size:0.8,color:'black',name:'',fixed:true});
==

evaluator ==
x=float(answer['M_x'])
y=float(answer['M_y'])
from math import hypot
if hypot(x-a, y-b)<0.1:
     score=100
else:
     score=0
feedback=""
==

