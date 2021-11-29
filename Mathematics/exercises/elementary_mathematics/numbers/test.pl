extends = /model/jsxgraph/clickpoint.pl

before ==
n = 1
k = choice([3, 5, 7])
if k == 3:
    c = choice([4, 2])
elif k == 5:
    c = choice([6, 3, 6, 3, 2])
elif k == 7:
    c = choice([8, 4, 8, 4, 2])
b = randint(1, c-1)
f = Rational(b, c)
xsol = b/c
ysol = 0

jxg.attributes =  {"showNavigation":False, "boundingbox":[-0.2,4,n+0.2,-4], "axis":False, "keepAspectRatio":False}
jxg.setscript(script_init + "\n"+ script_aux, locals())
==

name = M

question ==
Place le point $! M !$ d'abscisse $! \displaystyle {{f}} !$.
==


script_init ==
var ax = board.create('line', [[0,0],[1,0]], {fixed:true});
board.create('ticks',[ax, 1], {label: {anchorX: 'middle', anchorY: 'top', fontSize: 12, offset: [0, 30]}, anchor : 0., drawZero: true, drawLabels:true, minorTicks:{{ k }}, majorHeight:20, minorHeight:10});
var M = board.create('glider', [0., 0., ax], {name:'M',color:'blue',fixed:false, label: {anchorX: 'middle', anchorY: 'bottom', fontSize: 12, offset: [0, -30]}});
==

script_solution ==
board.create('point',[{{xsol}}, {{ysol}}],{name:'', color:'green'});
==

inputblock ==
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