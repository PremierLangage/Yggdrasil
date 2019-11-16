extends = /Mathematics/template/mathjsxgraph.pl

title=

histogram =: MathDrawer

histogram.attributes %=
{"boundingbox" : [-1,5,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

script ==
var a = board.create('chart', [{{series}}] , {chartStyle:'bar',color:'blue',width:0.6,labels:['0','1','3','4']});
==


before ==
import random
import statistics
series=[random.randint(1,4) for _ in range(4)]
labels = list(range(5))
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



