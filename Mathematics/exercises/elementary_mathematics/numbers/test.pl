extends = /model/jsxgraph/clickpoint.pl

before ==
xsol = 1
ysol = 0
jxg.setscript(script_init + "\n"+ script_aux)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-3,0.25,3.25,-0.25], "grid":true, "axis":false}

name = M

script_init ==
var ax = board.create('line', [[0,0],[1,0]]);
board.create('ticks',[ax, 5], {fixed:true, minorTicks:4, majorHeight:10, minorHeight:4});
var M = board.create('glider', [1., 0., ax], {name:'M',color:'blue',fixed:false});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==