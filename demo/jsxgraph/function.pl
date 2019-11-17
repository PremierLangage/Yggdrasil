extends = /Mathematics/template/mathjsxgraph.pl

title=

histogram =: MathDrawer

histogram.attributes %=
{"showNavigation": true}
==

script ==
board.setBoundingBox([-10,10,11,-1])
f = board.jc.snippet("x^2", true, "x", true);
board.create('functiongraph',f,{name:"f(x)", withLabel:true});
==


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
from jinja2 import Template
histogram.script = Template(script).render(locals())
==

lang = fr

text ==
Déterminer la médiane de la série statistique représentée ci-dessous.
{{ histogram | component }}
==

form ==

==

evaluator ==
grade=(100,"Bonne réponse")
==

