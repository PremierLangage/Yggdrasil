@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Cercle trigonométrique


before ==
import sympy as sp
import random
angle=random.choice([sp.Rational(1,2),1,sp.Rational(3,2)])*sp.pi
valangle=float(angle.evalf())
latexangle=sp.latex(angle)

==

text ==
Déplacer le point $%M%$ de sorte que l'angle $%(\overrightarrow{OA},\overrightarrow{OM})%$ ait une mesure égale à $%\displaystyle {{ latexangle }}.%$
==

form ==
<script type="text/javascript" charset="UTF-8" src="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js"></script>

<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css" />

<input type="hidden" id="form_answer">

<center>
<div id="jxgbox" class="jxgbox" style="width:300px; height:300px;"></div>
</center>

<script type="text/javascript">
JXG.Options.layer['line'] = 0;
var brd = JXG.JSXGraph.initBoard('jxgbox', {boundingbox:[-1.25,1.25,1.25,-1.25],axis:false, grid:false, showCopyright:false, showNavigation:false});
var xaxis = brd.create('axis',[[0,0],[1,0]]);
xaxis.removeAllTicks();
var yaxis = brd.create('axis',[[0,0],[0,1]]);
yaxis.removeAllTicks();
for (var i = -4; i <= 4; i++) {
brd.create('line',[[0,i*0.25],[1,i*0.25]],{color:'lightgrey',fixed:true,highlight:false});
}
for (var i = -4; i <= 4; i++) {
brd.create('line',[[i*0.25,0],[i*0.25,1]],{color:'lightgrey',fixed:true,highlight:false});
}
var ci= brd.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true,highlight:false});
var O = brd.create('point', [0,0],{size:1,name:'O',color:'black',showInfobox:false,fixed:true,highlight:false});
var A = brd.create('point', [1,0],{size:1,name:'A',color:'black',showInfobox:false,fixed:true,highlight:false});
var p = brd.create('glider',[1,1,ci],{size:2,name:'M',color:'red',showInfobox:false,highlight:false});
var secOAM = brd.create('sector',[O,A,p],{color:'orange',highlight:false});

p.on('drag', function(){
                  document.getElementById('form_answer').value = (Math.atan2(p.Y(),p.X())).toFixed(5);
            });
</script>
==


evaluator ==
ans=float(response['answer'])
if abs(ans-valangle)<0.03:
    grade=(0,"Bonne réponse")
else:
    grade=(0,"Mauvaise réponse")
==









