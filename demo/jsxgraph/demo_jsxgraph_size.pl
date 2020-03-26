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
.jsxgraph-component2 {
    max-width:300px;
    width:90vw;
    max-height:300px;
    height:90vw;
    margin: 0 auto;
}
</style>
==



