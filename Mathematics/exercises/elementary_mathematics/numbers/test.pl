extends = /model/jsxgraph/clickpoint.pl

before ==
xsol = 1
ysol = 0
jxg.setscript(script_aux + script_init)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-3,3,3.,-2], "grid":true, "axis":false}

name = M

script_init ==
var ax = board.create('line', [[0,0],[1,0]]);
board.create('ticks',[ax, 5], {fixed:true, minorTicks:4, majorHeight:10, minorHeight:4});
var M = board.create('glider', [1., 0., ax], {name:'M',color:'blue',fixed:false});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==

inputblock ==
{{ jxg|component }}
==