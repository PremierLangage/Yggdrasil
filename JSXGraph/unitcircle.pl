extends = JSXGraph.pl

title = Cercle trigonométrique

before ==
import sympy as sp
import random as rd
angle=rd.choice([sp.Rational(1,2),1,sp.Rational(3,2),sp.Rational(1,4),sp.Rational(3,4),sp.Rational(5,4)])*sp.pi
valangle=float(angle.evalf())
latexangle=sp.latex(angle)
formmode="input"
==

text ==
Déplacer le point $% M %$ de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{ latexangle }}. %$
==

jxgform ==
<div id="jxgbox" class="jxgbox" style="width:400px; height:400px; margin: 0 auto;"></div>
==

jxgscript.base ==
JXG.Options.layer['line'] = 0;
var brd = JXG.JSXGraph.initBoard('jxgbox', {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false,grid:false,showCopyright:false,showNavigation:false});
var xaxis = brd.create('axis',[[0,0],[1,0]]);
xaxis.removeAllTicks();
var yaxis = brd.create('axis',[[0,0],[0,1]]);
yaxis.removeAllTicks();
for (var i = -4; i <= 4; i++){
    brd.create('line',[[0,i*0.25],[1,i*0.25]],{color:'lightgrey',fixed:true,highlight:false});};
for (var i = -4; i <= 4; i++){
    brd.create('line',[[i*0.25,0],[i*0.25,1]],{color:'lightgrey',fixed:true,highlight:false});};
var ci= brd.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true,highlight:false});
var O = brd.create('point', [0,0],{size:1,name:'O',color:'black',showInfobox:false,fixed:true,highlight:false});
var A = brd.create('point', [1,0],{size:1,name:'A',color:'black',showInfobox:false,fixed:true,highlight:false});
==

jxgscript.input ==
var M = brd.create('glider',[1,1,ci],{size:2,name:'M',color:'red',showInfobox:false,highlight:false});
var secOAM = brd.create('sector',[O,A,M],{color:'orange',highlight:false});
function form_x() {return M.X()};
function form_y() {return M.Y()};
==

jxgscript.correction ==
var M = brd.create('glider',[answer.x,answer.y,ci],{size:2,name:'M',fixed:true,color:'red',showInfobox:false,highlight:false});
var secOAM = brd.create('sector',[O,A,M],{color:'orange',highlight:false});
==


evaluator ==
x=float(answer['x'])
y=float(answer['y'])
from math import atan2,pi
if abs((atan2(y,x)-valangle)%(2*pi))<0.1:
     grade=(100,"Bonne réponse")
else:
     grade=(0,"Mauvaise réponse"+str(atan2(y,x)-valangle))
formmode="correction"
==

