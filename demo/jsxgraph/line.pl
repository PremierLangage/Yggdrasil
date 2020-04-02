extends = /model/math.pl

settings.feedback = rightwrong

title = Droite

jxg =: MathDrawer
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}

before ==
a=randint(-4,4,[0])
b=randint(-4,4,[0])
x=symbols('x')
f=a*x+b

jxg.setscript(script_init)
==

script_init ==
var A = board.create('point',[1,1],{size:2,name:'A',color:'blue',withLabel:false});
var B = board.create('point',[-1,-1],{size:2,name:'B',color:'blue',withLabel:false});
var line = board.create('line',[A,B]);
==

text ==
Tracer la droite d'équation $! y = {{f.latex}} !$.
==

form ==
{{ jxg | component }}
==

script_wrong ==
var linesol = board.create('line',[[0,{{b}}],[1,{{a}}+{{b}}]],{color:'green'});
==

evaluator ==
xA, yA = jxg.getpoint('A')
xB, yB = jxg.getpoint('B')

ansa = (yA-yB)/(xA-xB)
ansb = yB-ansa*xB
if equal_approx(atan2(ansa,1), atan2(a,1), 0.1, modulo=pi) and abs(ansb-b)<0.15:
    score = 100
else:
    score = 0
    jxg.addscript(script_wrong,globals())

jxg.disabled = True
==

