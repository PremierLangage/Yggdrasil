extends = /template/basic.pl

title = Histogramme (statique)

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,10,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.css = jxgclass

extracss==
<style>
.jxgclass {
    width:100px;
}
</style>
==

jxg.script ==
var a = board.create('chart', [5,7,4,9], {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
