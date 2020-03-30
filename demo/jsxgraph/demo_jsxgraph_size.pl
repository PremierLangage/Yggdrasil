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
.myclass {
    max-width: 300px !important;
    width: 90vw  !important;
    max-height: 200px !important;
    height: 90vw !important;
    margin: 0 auto !important;
}
</style>
==


