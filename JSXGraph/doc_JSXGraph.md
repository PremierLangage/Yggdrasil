# JSXGraph

## Résumé

Modifier des objets géométriques dans un panneau JSXGraph.

* **Inclusion:** `extends = /template/JSXGraph.pl`

* **Dépendance:**
    * `@ /utils/sandboxio.py`
    * `@ /grader/evaluator.py [grader.py]`
    * `@ /builder/before.py [builder.py]`
    * `form =@ /form/form_JSXGraph.html`


* **Clés utilisées**: `before, evaluator, jxgform, jxgscript.base, jxgscript.input, jxgscript.correction`
___


## Utilisation

La clé `jxgscript.input` contient un script qui construit des objets géométriques dans le panneau JSXGraph. Les quantités retournées par les fonctions nommées form_XXX sont récupérées dans le grader. 

## Exemples

### coordpoint.pl

```
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
x=float(answer['x'])
y=float(answer['y'])
from math import hypot
if hypot(x-a,y-b)<0.2:
     grade=(100,"Bonne réponse")
else:
     grade=(0,"Mauvaise réponse")
formmode="correction"
==
```
