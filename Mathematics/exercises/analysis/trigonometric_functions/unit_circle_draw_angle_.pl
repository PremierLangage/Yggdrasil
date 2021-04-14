extends = /model/jsxgraph/clickpoint.pl
extends = /model/math/math.pl

title = Cercle trigonométrique

before ==
lstangle = eval(param['lstangle'])
angle = choice(lstangle)
valangle = float(angle.evalf())
xsol = float(cos(valangle))
ysol = float(sin(valangle))
jxg.setscript(script_init)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-1.25,1.25,1.25,-1.25]}

name = M

script_init4 ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'red',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

script_init ==
board.create('grid', [], {gridX: 0.25, gridY: 0.25});
board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point', [0,0],{size:1, name: 'O', color: 'black', fixed: true});
var A = board.create('point', [1,0],{size:1, name: 'A', color: 'black', fixed: true});
var M = board.create('glider', [1, 0.5, circle],{name:'M',color:'blue',fixed:false});
board.create('sector', [O, A, M], {color: 'orange'});
==


text ==
Placer le point $% M %$ d'affixe $%{{ z|latex }}%$ dans le plan ci-dessous.
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==



form==
<center>
{{ jxg|component }}
</center>
==


form2 ==
<div class="img-container">
{{ jxg|component }}
</div>
==

evaluator3 ==
x, y = jxg.getpoint(name)
from math import atan2,pi
if abs((atan2(y,x)-angle)%(2*pi))<0.1:
    score = 100
    jxg.addscript(script_solution, globals())
else:
    score = 0
    jxg.addscript(script_solution, globals())
feedback = ""
==



