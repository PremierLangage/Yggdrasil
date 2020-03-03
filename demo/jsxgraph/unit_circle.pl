extends = /model/math.pl

title = Cercle trigonométrique

# Le composant va être renommé JSXGraph
jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
@ /utils/components/jsxgraph.py [customjsxgraph.py]
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-1.25,1.25,1.25,-1.25]}

before ==
angle=randitem([pi/4,pi/2,3*pi/4,pi,5*pi/4,3*pi/2,7*pi/4])

jxg.loadscript(script_init)
==

script_init ==
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('glider',[1,0.5,circle],{size:2,name:'M',color:'blue',fixed:false});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

text ==
Placer le point M de sorte que l'angle $% (\overrightarrow{OA},\overrightarrow{OM}) %$ ait une mesure égale à $% \displaystyle {{angle.latex}} %$. 
==

form ==
{{ jxg | component }}
==

script_wrong ==
M.setAttribute({color:'red', withLabel:false});
var Msol = board.create('glider',[{{xsol}},{{ysol}},circle],{size:2,name:'M',color:'green',fixed:false});
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


extracss==
<style>
.jsxgraph-component {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
</style>
==


