extends = /model/math/multimathinput.pl

param.angles = "pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4"

equality = "Modulo"

modulo = 2*pi

before ==
from jxginput import JXGViewer
jxg = JXGViewer()
lstangle=eval(param['angles'])
angle=choice(lstangle)
cosangle=cos(angle).evalf()
sinangle=sin(angle).evalf()
xM=float(cosangle)
yM=float(sinangle)
jxg.set_attributes(attributes)
jxg.set_script(script, globals())

inputs = [MathInput(type="expr"), MathInput(type="expr")]
prefixes = [f"$! \displaystyle \sin( {latex(angle)} ) = !$", f"$! \displaystyle\cos( {latex(angle)} ) = !$"]
inputs[0].sol = sin(angle)
inputs[1].sol = cos(angle)
==

attributes ={"boundingbox": [-1.25, 1.25, 1.25, -1.25], "showNavigation": False, "axis": False, "grid": False}

script ==
var grid = board.create('grid',[],{gridX:0.25,gridY:0.25});
var Ox = board.create('axis',[[0,0],[1,0]],{ticks:{visible:false}});
var Oy = board.create('axis',[[0,0],[0,1]],{ticks:{visible:false}});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
var O = board.create('point',[0,0],{size:1,name:'O',color:'black',fixed:true});
var A = board.create('point',[1,0],{size:1,name:'A',color:'black',fixed:true});
var M = board.create('point',[ {{xM}} , {{yM}} ],{size:1,name:'M',color:'black',fixed:true});
var secOAM = board.create('sector',[O,A,M],{color:'orange'});
==

question ==
Sur le cercle unité ci-dessous, on a représenté l'angle $! (\overrightarrow{OA},\overrightarrow{OM}) !$ de mesure $! {{ angle|latex }} !$. En déduire le sinus et le cosinus de $! {{ angle|latex }} !$. 

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
