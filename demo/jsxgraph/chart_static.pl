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
.box {
    max-width:400px !important;
    width:90vw !important;
    max-height:400px !important;
    height:90vw !important;
    margin: 0 auto !important;
}
</style>
==

jxg.script ==
var a = board.create('chart', [5,7,4,9], {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
