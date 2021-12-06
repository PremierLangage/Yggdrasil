extends = droite_graduee_.pl

before ==
n = 1
k = choice([3, 5, 5, 7, 7])
if k == 3:
    c = choice([4, 4, 2])
elif k == 5:
    c = choice([6, 6, 3, 3, 3, 2])
elif k == 7:
    c = choice([8, 8, 4, 4, 4, 2])
b = randint(1, c-1)

xsol = b/c
ysol = 0

jxg.attributes =  {"showNavigation":False, "boundingbox":[-0.2,4,n+0.2,-4], "axis":False, "keepAspectRatio":False}
jxg.setscript(script_init + "\n"+ script_aux, locals())
==

question ==
Place le point $! M !$ d'abscisse $! \displaystyle \frac{ {{b}} }{ {{c}} } !$.
==


inputblock ==
<link rel="stylesheet" type="text/css" href="https://unpkg.com/jsxgraph@1.4.0/distrib/jsxgraph.css" />
<script type="text/javascript" src="https://unpkg.com/jsxgraph@1.4.0/distrib/jsxgraphcore.js"></script>
<div id='outer' style='max-width: 1000px; margin: 0 auto;'>
<div id='jxgbox' class='jxgbox' style='height: 0; padding-bottom: 30%'></div>
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