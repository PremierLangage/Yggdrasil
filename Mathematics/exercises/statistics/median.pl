@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Médiane

histogram =: MathDrawer

histogram.boardAttributes % {"boundingbox": [-1, 10, 11, -2], "axis": true,"showCopyright":false, "showNavigation":false});

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
ndst=[0]*len(dst)
for i in range(len(dst)):
    ndst[dst[i]]=i
dst = ndst 
sol=statistics.median(smp)
vmax=max(dst)+2

MathDrawer.script = """
<script type="text/javascript">
var dataArr = %s ;
var a = board.create('chart', dataArr, {chartStyle:'bar',color:'blue',width:0.6});
</script>
""" % str(dst)

==

lang = fr

text ==
Déterminer la médiane de la série statistique représentée ci-dessous.
{{ histogram | component }}
==

form ==

==

evaluator ==
ans=float(response['answer'])
if ans==sol:
    grade=(100,"Bonne réponse")
else:
    grade=(0,"Mauvaise réponse. La médiane est : "+str(sol))
==



