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

extracss ==
.myclass {
    max-width: 200px;
    width: 90vw;
    max-height: 200px;
    height: 90vw;
    margin: 0 auto;
}
</style>
==
