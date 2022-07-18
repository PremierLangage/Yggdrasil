extends = /model/math/tuple.pl

title = Lire les coordonnées d'un vecteur

before ==
from jxginput import JXGViewer
jxg = JXGViewer()
xA, yA = randint(-5, 5), randint(-5, 5)
xB, yB = randint(-5, 5), randint(-5, 5)
sol = (xB-xA, yB-yA)
jxg.set_attributes(attributes)
jxg.set_script(script, globals())
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

script == #|js|
var pt1 = board.create('point', [{{xA}}, {{yA}}], {color:'blue', name: 'A', size: 0.5, withLabel: false, fixed: true});
var pt2 = board.create('point', [{{xB}}, {{yB}}], {color:'blue', name: 'B', size: 0.5, withLabel: false, fixed: true});
var vec = board.create('segment', [pt1, pt2], {color:'blue', fixed:true, lastArrow: {type: 2, size: 6}});
==


question ==
Déterminer les coordoonées du vecteur représenté ci-dessous.
{{ jxg|html }}
==

style.jxgcss ==
<style>
.jsxgraph-component {
    width: 400px;
    height: 400px;
    margin: 0 auto;
    border: 1px solid;
}
</style>
==
