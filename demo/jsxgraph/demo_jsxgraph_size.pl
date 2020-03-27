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
    max-width: 300px;
    max-height: 300px;
}
.jsxgraph-component {
    max-width: 300px;
    max-height: 300px;
}
</style>
==





