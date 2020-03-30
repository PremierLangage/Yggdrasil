@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Resize JSXGraph

jxg =: MathDrawer

jxg.attributes % {"showNavigation": false, "boundingbox": [-5, 5, 5, -5]}

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

extracss ==
<style>
.jsxgraph-component.myclass {
    max-width: 300px;
    width: 90vw;
    max-height: 300px;
    height: 90vw;
    margin: 0 auto;
}
</style>
==



