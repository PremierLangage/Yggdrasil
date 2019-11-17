extends = /template/basic.pl

title = Histogramme (statique)

jxg =: MathDrawer

jxg.attributes %=
{"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.script ==
board.setBoundingBox([-1,10,5,-1]);
board.create('chart', [5,7,4,9], {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
