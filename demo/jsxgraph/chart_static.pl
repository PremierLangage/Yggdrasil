extends = /Mathematics/template/mathjsxgraph.pl

title=

histogram =: MathDrawer

histogram.attributes %=
{"boundingbox" : [-1,5,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

script ==
var a = board.create('chart', [1,3,1,2] , {chartStyle:'bar',color:'blue',width:0.6});
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



