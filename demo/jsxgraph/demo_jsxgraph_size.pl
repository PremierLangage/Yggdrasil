extends = /model/math.pl

title = Resize JSXGraph

jxg =: MathDrawer

jxg.attributes % {"showNavigation": false, "boundingbox": [-5, 5, 5, -5], "keepAspectRatio": true}

jxg.css = myclass2


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
.myclass {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
.jsxgraph-component {
    max-width: 200px;
    max-height: 100px;
}
</style>
==





