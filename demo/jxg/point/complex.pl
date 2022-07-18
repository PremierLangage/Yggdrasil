extends = /model/jxg/point.pl

before ==
xsol = randint(-4, 4, [0])
ysol = randint(-4, 4, [0])
z = xsol + ysol*I
==

question ==
Placer le point $! M !$ d'affixe $! {{ z|latex }} !$ dans le plan ci-dessous.
==

attributes.showNavigation = False
attributes.boundingbox = [-6, 6, 6, -6]

tol = 0.2

pointname = "M"

jxgscript == #|js|
board.create('grid', [], {gridX: 1, gridY: 1});
board.create('axis', [[0, 0], [1, 0]], {name: 'Re', withLabel: true, label: {position:'urt', offset: [-5, 10]}, ticks:{visible: false}});
board.create('axis', [[0, 0], [0, 1]], {name: 'Im', withLabel: true, label: {position: 'urt', offset: [10, 0]}, ticks:{visible: false}});
var psol = board.create('point', [0, 0], {size: 2, name: 'M', color: 'blue'});
==
