extends = /model/math.pl

title = Démo JSXGraph

# Le composant sera bientôôt renommé JSXGraph
jxg =: MathDrawer
# Les deux lignes suivantes sont temporaires.
jxg.decorator = CustomJSXGraph

jxg.attributes % {"showNavigation":false, "boundingbox":[-6,6,6,-6]}

before ==
jxg.setscript(script_init)
==

script_init ==
var A = board.create('point', [-2,2], {size:2, name:'A', color:'red'});
var B = board.create('point', [1,1], {size:2, name:'B', color:'blue'});
var C = board.create('point', [0,0], {size:2, name:'C', color:'blue'});
var line = board.create('line', [B, C]);
==

text ==
Déplacer les points.
==

form ==
{{ jxg|component }}
==

evaluator ==
grade = (100, str(jxg.points))
==


