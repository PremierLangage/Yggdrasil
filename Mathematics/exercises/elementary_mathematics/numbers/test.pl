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
<div id="jxgbox2" class="jxgbox" style="width:100%; height:100px;"></div>
<script type="text/javascript">
var board2 = JXG.JSXGraph.initBoard('jxgbox2', {showNavigation:false, boundingbox:[-0.5,4,5.5,-4], grid:false});
var ax = board2.create('line', [[0,0],[1,0]], {fixed:true});
board2.create('ticks',[ax, 1], {label: {anchorX: 'middle', anchorY: 'top', fontSize: 12, offset: [0, 30]}, anchor : 0., drawZero: true, drawLabels:true, minorTicks:2, majorHeight:20, minorHeight:10});
var M = board2.create('glider', [1., 0., ax], {name:'M',color:'blue',fixed:false});
</script>
==
script_init ==

==

script_init3 ==
//var board2 = JXG.JSXGraph.initBoard('jxgbox2', {showNavigation:false, boundingbox:[-0.5,4,5.5,-4], grid:false});
var ax = board.create('line', [[0,0],[1,0]], {fixed:true});
board.create('ticks',[ax, 1], {label: {anchorX: 'middle', anchorY: 'top', fontSize: 12, offset: [0, 30]}, anchor : 0., drawZero: true, drawLabels:true, minorTicks:2, majorHeight:20, minorHeight:10});
var M = board.create('glider', [1., 0., ax], {name:'M',color:'blue',fixed:false});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==

inputblock ==

==