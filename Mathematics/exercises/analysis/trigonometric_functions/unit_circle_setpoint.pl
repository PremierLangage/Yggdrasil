extends =  /Mathematics/template/mathbasic2.pl

@ /input/jsxgraph/template.html [jsxgraph_template.html]
@ /input/jsxgraph/head.html [jsxgraph_head.html]
@ /input/mathexpr/template.html [mathexpr_template.html]
@ /input/mathexpr/head.html [mathexpr_head.html]
@ /input/mathexpr/process.py [mathexpr_process.py]

title = Cercle trigonométrique

lang = fr

before ==
angle=Rational(randint(1,7),4)*pi
xM=float((cos(angle)).evalf())
yM=float((sin(angle)).evalf())
==

text ==
Quelle est la mesure (en radians) de l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ représenté ci-dessous. 
==

input.1.attributes = {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[ {{ xM }} , {{ yM }} ,circle],{size:2,name:'M',color:'red',fixed:true});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==


form ==
{{input_1 | safe}}
<br>
{{input_2 | safe}}
==

input.1.type = jsxgraph
input.1.style = max-width:300px;width:80vw;max-height:300px;height:80vw;margin: 0 auto;
input.1.boardname = board

input.2.type = mathexpr
input.2.virtualKeyboardMode = manual
input.2.virtualKeyboards = elementary

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

