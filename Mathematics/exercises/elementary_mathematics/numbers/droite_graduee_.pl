extends = /model/jsxgraph/clickpoint.pl

script_init ==
var ax = board.create('line', [[0,0],[1,0]], {fixed:true});
board.create('ticks',[ax, 1], {label: {anchorX: 'middle', anchorY: 'top', fontSize: 12, offset: [0, 30]}, anchor : 0., drawZero: true, drawLabels:true, minorTicks:{{ k }}, majorHeight:20, minorHeight:10});
var M = board.create('glider', [0., 0., ax], {name:'M',color:'blue',fixed:false, label: {anchorX: 'middle', anchorY: 'bottom', fontSize: 12, offset: [0, -30]}});
==

name = M

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==

inputblock ==
<link rel="stylesheet" type="text/css" href="https://unpkg.com/jsxgraph@1.4.0/distrib/jsxgraph.css" />
<script type="text/javascript" src="https://unpkg.com/jsxgraph@1.4.0/distrib/jsxgraphcore.js"></script>

{{ jxg|component }}
==

style.jxgcss ==
<style>
.jsxgraph-component {
    width: 500px;
    max-width: 100%;
    height: 100px;
    margin: 0 auto;
}
</style>
==

style.jxgcss ==
<style>
.jsxgraph-component {
  width: 500px;
  padding-bottom: 30%
}
</style>
==
