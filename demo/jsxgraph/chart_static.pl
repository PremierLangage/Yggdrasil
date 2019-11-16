extends = /template/basic.pl

title = Histogramme

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,5,10,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.script ==
var a = board.create('chart', [5,7,4,9] , {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
