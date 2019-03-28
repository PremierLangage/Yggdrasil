extends = JSXGraph.pl

title = Placer un point dans un repère

before ==
import random as rd
a=rd.randint(-4,4)
b=rd.randint(-4,4)
data={'a':a,'b':b}
formmode="input"
==

text ==
Déplacer le point A aux coordonnées ({{ a }},{{ b }}).
==

jxgform ==
<div id="jxgbox" class="jxgbox" style="width:400px; height:400px; margin: 0 auto;"></div>
==

jxgscript.base ==
var brd = JXG.JSXGraph.initBoard('jxgbox',{boundingbox:[-5, 5, 5, -5],axis:true,showCopyright:false,showNavigation:false});
==

jxgscript.input ==
var A = brd.create('point',[0,0],{showInfobox:false});
function form_x() {return A.X()};
function form_y() {return A.Y()};
==

jxgscript.correction ==
var A = brd.create('point',[answer.x,answer.y],{name:'',fixed:true,highlight:false,showInfobox:false});
var Asol = brd.create('point',[data.a,data.b],{name:'A',color:'green',fixed:true,highlight:false,showInfobox:false});
==

evaluator ==
x=float(response['x'])
y=float(response['y'])
from math import hypot
if hypot(x-a,y-b)<0.2:
    form=""
    grade=(100,"Bonne réponse")
elif hypot(x-a,y-b)<1.0:
    grade=(10," Soyez plus précis")
else:
    grade=(0,"Mauvaise réponse")
formmode="correction"
==



