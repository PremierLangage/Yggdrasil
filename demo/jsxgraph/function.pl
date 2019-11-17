extends = /Mathematics/template/mathjsxgraph.pl

title = Graphe d'une fonction

jxg =: MathDrawer

jxg.attributes %=
{"showNavigation": true,
"keepaspectratio" : false}
==

jxg.script ==
board.setBoundingBox([-1,4,4,-4])
f = board.jc.snippet("x*sin(x)", true, "x", true);
board.create('functiongraph',f,{name:"f(x)", withLabel:true});
==
