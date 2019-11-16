extends = /template/basic.pl

title = Histogramme (statique)

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,10,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

jxg.css= box


extracss==
<style>
.jsxgraph-component {
    max-width:250px;
    width:90vw;
    max-height:250px;
    height:90vw;
    margin: 0 auto;
}
.box {
    width:60vw;
    height:40vw;
}
</style>
==

jxg.script ==
var a = board.create('chart', [5,7,4,9], {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
