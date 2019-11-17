extends = /template/basic.pl

title = Graphe d'une fonction

jxg =: MathDrawer

jxg.attributes %=
{"showNavigation": true,
"keepaspectratio" : false}
==

jxg.script ==
board.setBoundingBox([-1,4,4,-4]);
f = board.jc.snippet("x*sin(x)", true, "x");
board.create('functiongraph',f);
==

text ==
{{ jxg | component }}
==
