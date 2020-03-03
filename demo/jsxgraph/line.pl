extends = /model/math.pl

title = Cercle trigonométrique

# Le composant va être renommé JSXGraph
jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}

before ==
a=randint(-4,4,[0])
b=randint(-4,4,[0])
x=symbols('x')
f=a*x+b

jxg.loadscript(script_init)
==

script_init ==
var A = board.create('point',[1,1],{size:2,name:'A',color:'blue',withLabel:false});
var B = board.create('point',[-1,-1],{size:2,name:'B',color:'blue',withLabel:false});
var line = board.create('line',[A,B]);
==

text ==
Tracer la droite d'équation $! y = {{f.latex}} !$ dans le plan ci-dessous.
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



if equal_approx(atan2(yA-yB,xA-xB), atan2(a,1), 0.1) and sqrt(:
    score = 100
else:
    score = 0
    jxg.addscript(script_wrong,globals())

jxg.disabled = True
==
