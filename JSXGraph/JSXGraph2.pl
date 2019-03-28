@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

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
ndst=[0]*dst.lenght
for i in range(dst.lenght):
    ndst[dst[i]]=i
dst = ndst 
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
var board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox: [-1, {{vmax}}, 11, -2], axis: true,showCopyright:false, showNavigation:false});
var dataArr = {{dst}};
var a = board.create('chart', dataArr, {chartStyle:'bar',color:'blue',width:0.6});
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


