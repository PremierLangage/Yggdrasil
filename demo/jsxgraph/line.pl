extends = /model/math.pl

title = Cercle trigonométrique

# Le composant va être renommé JSXGraph
jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}

before ==
a=randint(-5,5)
b=randint(-5,5)
from math import atan2,pi
theta=abs(atan2(a,1))
x=symbols('x')
latexf=latex(a*x+b)

jxg.loadscript(script_init)
==

script_init ==
var A = board.create('point',[1,1],{size:2,name:'A',color:'red',withLabel:false});
var B = board.create('point',[-1,-1],{size:2,name:'B',color:'red',withLabel:false});
var line = board.create('line',[A,B]);
==

text ==
Tracer la droite d'équation $! y = {{latexf}} !$ dans le plan ci-dessous.
==

form ==
{{ jxg | component }}
==

script_wrong ==
var linesol = board.create('line',[[0,{{b}}],[1,{{a}}+{{b}}]],{color:'green'});
==

evaluator ==
x = jxg.points['M']['x']
y = jxg.points['M']['y']

angle_float = angle.evalf()
xsol = cos(angle_float)
ysol = sin(angle_float)

if equal_approx(atan2(y,x), angle_float, 0.1, modulo=2*pi):
    score = 100
else:
    score = 0
    jxg.addscript(script_wrong,globals())

jxg.disabled = True
==


form ==
{{ jxg | component }}
==



