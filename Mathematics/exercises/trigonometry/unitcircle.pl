extends = /template/input/mathjsxgraph.pl

title = Cercle trigonométrique

lang = fr

maxattempt = 3

before ==
angle=randitem([Rational(1,2),1,Rational(3,2),Rational(1,4),Rational(3,4),Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=latex(angle)
==

text ==
Déplacer le point $% M %$ de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{ latexangle }}. %$
==

input.1.attributes = {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showNavigation:false}

input.1.script.main ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,1,circle],{size:2,name:'M',color:'red'});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==


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




