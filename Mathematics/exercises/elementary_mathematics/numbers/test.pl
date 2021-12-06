


inputblock ==
<div id='outer' style='max-width: 500px; margin: 0 auto;'>
<div id='jxgbox' class='jxgbox' style='height: 0; padding-bottom: 100%'></div>
</div>
<button onClick="board.toFullscreen('outer')">Fullscreen</button>

<script language="Javascript" type='text/javascript'>
var board = JXG.JSXGraph.initBoard('jxgbox', {
    axis:true,
    boundingbox:[-5,5,5,-5],
    fullscreen: { id: 'outer' },
    showFullscreen: true
});
var p = board.create('point', [-2, 3], {});
</script>
==