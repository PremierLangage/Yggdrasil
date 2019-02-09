@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Déplacer un point

before ==
import random as rd
a=rd.randint(-4,4)
b=rd.randint(-4,4)
==

text ==
Déplacer le point A aux coordonnées ({{ a }},{{ b }}).
==

jxgscript ==
var brd = JXG.JSXGraph.initBoard('jxgbox',{boundingbox:[-5, 5, 5, -5],axis:true,showCopyright:false,showNavigation:false});
var A = brd.create('point',[0,0]);
function form_x() {return A.X()};
function form_y() {return A.Y()};
==

jxgform ==
<div id="jxgbox" class="jxgbox" style="width:300px; height:300px; margin: 0 auto;"></div>
==

form =@ form_JSXGraph.html

evaluator ==
x=float(answer['x'])
y=float(answer['y'])
from math import sqrt
if sqrt((x-a)**2+(y-b)**2)<0.2:
     grade=(100,"Bonne réponse")
else:
     grade=(0,"Mauvaise réponse")
==
