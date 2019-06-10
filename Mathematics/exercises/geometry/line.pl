extends = /Mathematics/template/mathjsxgraph.pl

title = Tracer une droite

lang = fr

maxattempt = 3

before ==
a=randint(-5,5)
b=randint(-5,5)
from math import atan2,pi
theta=abs(atan2(a,1))
x=symbols('x')
latexf=latex(a*x+b)
==

text ==
Tracer la droite d'équation $% y = {{latexf}}%$ dans le plan ci-dessous.
==

input.1.attributes = {boundingbox:[-6,6,6,-6],axis:true,grid:true,showNavigation:true}

input.1.script.main ==
var A = board.create('point',[1,1],{size:2,name:'A',color:'red',withLabel:false});
var B = board.create('point',[-1,-1],{size:2,name:'B',color:'red',withLabel:false});
var line = board.create('line',[A,B]);
==

input.1.script.solution ==
var linesol = board.create('line',[[0,{{b}}],[1,{{a}}+{{b}}]],{color:'green'});
==


evaluator ==
xA=float(answer['A_x'])
yA=float(answer['A_y'])
xB=float(answer['B_x'])
yB=float(answer['B_y'])
bans=yA-(yA-yB)/(xA-xB)*xA 
from math import atan2,pi
if abs(abs(atan2(yA-yB,xA-xB))-theta)<0.1 and abs(b-bans)<0.1:
     score=100
else:
     score=0
==



settings.allow_reroll=yes
