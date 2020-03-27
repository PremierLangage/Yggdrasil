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
.myclass {
    max-width: 300px;
    max-height: 300px;
}
.jsxgraph-component {
    max-width: 100px;
    max-height: 100px;
}
</style>
==





