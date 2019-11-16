extends = /template/basic.pl

title=

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,5,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.script ==
var a = board.create('chart', [1,3,1,2] , {chartStyle:'bar',color:'blue',width:0.6});
==


lang = fr

text ==
{{ histogram | component }}
==

form ==

==

evaluator ==
grade=(100,"Bonne réponse")
==



