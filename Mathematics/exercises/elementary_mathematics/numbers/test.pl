extends = /model/jsxgraph/clickpoint.pl

before ==
xsol = 1
ysol = 0
jxg.setscript(script_init)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-1.25,1.25,1.25,-1.25]}

name = M

script_init ==
var ax1 = board.create('line', [[0,0],[3,1]]);
board.create('ticks',[ax1, 5], {minorTicks:4, majorHeight:10, minorHeight:4});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==

inputblock ==
{{ jxg|component }}
==