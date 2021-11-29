extends = /model/jsxgraph/clickpoint.pl

before ==
xsol = 1
ysol = 0
jxg.setscript(script_init + "\n"+ script_aux)
==

jxg.attributes % {"showNavigation":false, "boundingbox":[-3,0.25,3.25,-0.25], "keepaspectratio": true, "grid":true, "axis":false}

name = M
question ==
<link rel="stylesheet" type="text/css" href="https://jsxgraph.uni-bayreuth.de/distrib/jsxgraph.css" />
<script type="text/javascript" src="https://jsxgraph.uni-bayreuth.de/distrib/jsxgraphcore.js"></script>
<div id="jxgbox" class="jxgbox" style="width:500px;"></div>
<script type="text/javascript">
var board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox:[-1,1,5,-1], keepaspectratio: true, grid:true});
</script>
==
script_init ==
var ax = board.create('line', [[0,0],[1,0]]);
board.create('ticks',[ax, 5], {fixed:true, minorTicks:4, majorHeight:10, minorHeight:4});
var M = board.create('glider', [1., 0., ax], {name:'M',color:'blue',fixed:false});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==