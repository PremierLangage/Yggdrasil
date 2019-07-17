extends =  /Mathematics/template/mathjsxgraph.pl

title = Point objet et point image en optique géométrique

lang = fr

before ==
d0,d1,d2,d3=-5,-2,2,5
import random
xobj=randitem([random.uniform(-8.5,-6.),random.uniform(-4,8.5)])
y0=[2,1,0,-1,-2]
y1=[]
for y in y0:
    z=y*(d1-d0)/(d0-xobj)+y
    y1.append(z) 

xim=8
y2=[2,1,0,-1,-2]
y3=[]
for y in y2:
    z=y*(d3-d2)/(d2-xim)+y
    y3.append(z)


==

text ==
Déplacer le point $% M %$ de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{ latexangle }}. %$
==

input.1.attributes = {boundingbox:[-9,4.5,9,-4.5],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
y0={{y0}}
y1={{y1}}
y2={{y2}}
y3={{y3}}
for(i = 0; i < 5; i++) {
    board.create('segment',[[{{d0}},y0[i]],[{{d1}},y1[i]]],{size:0.5,color:'blue',fixed:false});
    board.create('line',[[{{d0}},y0[i]],[{{d1}},y1[i]]],{visible:false});
    var M1 = board.create('glider',[({{d0}}+{{d1}})/2,(y0[i]+y1[i])/2,l],{visible:false});
    var M2 = board.create('glider',[({{d0}}+{{d1}})/2,(y0[i]+y1[i])/2,l],{name:"",size:2,color:'gray'});
    var l = board.create('segment',[[0,0],[-2,2]],{color:'gray'});
    board.create('segment',[[{{d2}},y2[i]],[{{d3}},y3[i]]],{size:0.5,color:'blue',fixed:false});
    var M1 = board.create('glider',[({{d2}}+{{d3}})/2,(y2[i]+y3[i])/2,l],{visible:false});
    var M2 = board.create('glider',[({{d2}}+{{d3}})/2,(y2[i]+y3[i])/2,l],{name:"",size:2,color:'gray'});
    var l = board.create('segment',[M1,M2],{color:'gray'});
}
var object = board.create('point',[0,0],{name:"Objet",color:'red'});
var image = board.create('point',[5,0],{name:"Image",color:'green'});
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


