extends = /model/math.pl

title = Affixe d'un nombre complexe

jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes %=
{"showNavigation" : false,
"boundingbox": [-6,6,6,-6],
"keepaspectratio" : false}
==

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

form ==
{{ jxg | component }}
==


script ==
A = board.create('point',[1,1],{size:2,name:'A',color:'red',withLabel:false});
B = board.create('point',[-1,-1],{size:2,name:'B',color:'red',withLabel:false});
line = board.create('line',[A,B]);
==

script_solution ==
var linesol = board.create('line',[[0,{{b}}],[1,{{a}}+{{b}}]],{color:'green'});
==

evaluator ==
# pas besoin de faire float(drawer.points['M']['x'])
# car une des fonctionnalités des composants et que
# dans un grader le type des propriétes est toujours le type
# spécifié dans la doc (dans ce cas les propriétes x et y d'un point
# sont des flottants c'est possible de le voir en mode debug).


x= jxg.points['M']['x']
y= jxg.points['M']['y']

from math import hypot
if hypot(x-a, y-b)<0.1:
     score=100
else:
     score=0

jxg.loadscript(script_solution,globals())

feedback=""
==









