@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Test 2
==

before==
==

text==
==

form ==
<center>
<div id="jxgbox" class="jxgbox" style="max-width:300px;width:80vw;max-height:300px;height:80vw;margin: 0 auto;"></div>
</center>
==

extrajs==
<script type="text/javascript" charset="UTF-8" src="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js"></script>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css" />
<script>
var board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox:[-1.25,1.25,1.25,-1.25]});
var circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
</script>
==
