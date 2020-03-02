extends = /model/math.pl

title = Cercle trigonométrique

jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes %=
{"showNavigation" : false,
"boundingbox": [-6,6,6,-6],
"keepaspectratio" : false}
==

before ==
angle=randitem([pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4])
valangle=float(angle.evalf())
xsol = float(cos(valangle))
ysol = float(sin(valangle))
jxg.loadscript(script)
==

text ==
Placer sur le cercle unité ci-dessous le point M de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% {{angle.latex}} %$. 
==

form ==
{{ jxg | component }}
==


script ==
board.setBoundingBox([-1.25,1.25,1.25,-1.25]);
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'red',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

script2 ==
var M = board.create('glider',[{{xsol}},{{ysol}},circle],{size:2,name:'M',color:'green',fixed:false});
==

evaluator ==
x=jxg.points['M']['x']
y=jxg.points['M']['y']
from math import atan2,pi
if abs((atan2(y,x)-angle)%(2*pi))<0.1:
    score=100
else:
    jxg.addscript(script2,globals())
    score=0
jxg.disabled = True
feedback=""
==

extracss==
<style>
.jsxgraph-component {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
</style>
==


