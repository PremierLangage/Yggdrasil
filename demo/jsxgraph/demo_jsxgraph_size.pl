extends = /model/math.pl

title = Angle

jxg1 =: MathDrawer

jxg1.attributes % {"showNavigation": false, "boundingbox": [-5, 5, 5, -5]}

jxg1.css = test

jxg2 =: MathDrawer

jxg2.attributes % {"showNavigation": false, "boundingbox": [-5, 5, 5, -5]}

jxg2.css = jsxgraph-component2

before ==

==

text ==

==

form ==
{{ jxg1|component }}
{{ jxg2|component }}
==


evaluator ==

==


extracss==
<style>
.jsxgraph-component {
    max-width:300px !important;
    width:90vw !important;
    max-height:300px !important;
    height:90vw !important;
    margin: 0 auto !important;
}
</style>
==



