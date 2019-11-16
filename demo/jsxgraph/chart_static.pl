extends = /template/basic.pl

title = Histogramme

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,5,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.script ==
var a = board.create('chart', [1,3,1,2] , {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
