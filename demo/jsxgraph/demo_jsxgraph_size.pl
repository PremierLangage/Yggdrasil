extends = /model/math.pl

title = Resize JSXGraph

jxg =: MathDrawer

jxg.attributes % {"showNavigation": false, "boundingbox": [-5, 5, 5, -5], "keepAspectRatio": true}

jxg.css = myclass


before ==

==

text ==

==

form ==
{{ jxg|component }}
==


evaluator ==

==

extracss==
<style>
.jsxgraph-component {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
.myclass {
    max-width:200px !important;
    width:90vw;
    max-height:200px !important;
    height:90vw;
    margin: 0 auto;
}
</style>
==





