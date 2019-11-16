extends = /Mathematics/template/mathjsxgraph.pl

title=

histogram =: MathDrawer

histogram.attributes %=
{"boundingbox" : [-1,5,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

script ==
var data= [[0,1,2,3,4,5,6,7,8,9,10], [4,1,3,2,5,7,1.5,2,4.5,8,5]];        
var a = board.create('chart', data , {chartStyle:'bar',color:'blue',width:0.6,labels:data});
==


before ==
import random
import statistics
data2=[list(range(1,5)),[random.randint(1,4) for _ in range(4)]]
data2=[[1,2,4],[1,2,3]]
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



