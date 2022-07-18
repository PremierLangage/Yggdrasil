extends = /template/mathexpr.pl

title = Médiane

before ==
import random
import statistics
med0=random.randint(3,7)
smp=[]
n=random.randint(8,12)
for i in range(n):
    smp.append(random.randint(1,med0))
for i in range(n):
    smp.append(random.randint(med0,10))
dst=[]
for i in range(1,11):
    dst.append(smp.count(i))
sol=statistics.median(smp)
vmax=max(dst)+2
==

lang = fr

text ==
Déterminer la médiane de la série statistique représentée ci-dessous.

<script type="text/javascript" charset="UTF-8" src="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js"></script>

<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css" />

<input type="hidden" id="form_answer">

<center>
<div id="jxgbox" class="jxgbox" style="width:300px; height:300px;"></div>
</center>
<script type="text/javascript">
var board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox: [-5, 6, 5, -6], axis: true,showCopyright:false, showNavigation:false});
var dataArr = {{dst}};
var p = [];
p[0] = board.create('point', [-1,2], {size: 4, face: 'o'});
p[1] = board.create('point', [0,-1], {size: 4, face: 'o'});
p[2] = board.create('point', [1,0], {size: 4, face: 'o'});
p[3] = board.create('point', [2,1], {size: 4, face: 'o'});
var c = board.create('spline', p, {strokeWidth:3});
</script>
==

form ==
<div class="input-group">
<input id="form_answer" type="text" class="form-control" value="{{ answers__.answer }}" required/>
</div>
==

evaluator ==
ans=float(response['answer'])
if ans==sol:
    grade=(100,"Bonne réponse")
else:
    grade=(0,"Mauvaise réponse. La médiane est : "+str(sol))
==


