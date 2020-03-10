extends = /model/math.pl

title = Droite

# Le composant va être renommé JSXGraph
jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}

before ==
jxg.setscript(script_init)
==

script_init ==
var A = board.create('point',[-2,2],{size:2,name:'A',color:'red'});
var B = board.create('point',[1,1],{size:2,name:'B',color:'blue'});
var C = board.create('point',[0,0],{size:2,name:'C',color:'blue'});
var line = board.create('line',[B,C]);
==

text ==
Déplacer les points.
==

form ==
{{ jxg | component }}
==

script_wrong ==
var linesol = board.create('line',[[0,{{b}}],[1,{{a}}+{{b}}]],{color:'green'});
==

evaluator ==
xA = jxg.points['A']['x']
yA = jxg.points['A']['y']
xB = jxg.points['B']['x']
yB = jxg.points['B']['y']

ansa = (yA-yB)/(xA-xB)
ansb = yB-ansa*xB
if equal_approx(atan2(ansa,1), atan2(a,1), 0.1, modulo=pi) and abs(ansb-b)<0.15:
    score = 100
else:
    score = 0
    jxg.addscript(script_wrong,globals())

jxg.disabled = True
==

