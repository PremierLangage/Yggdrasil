# D. Doyen
# 7/3/2021
# complex numbers, affix, complex plane, geometrical representation
# Placer dans le plan un point d'affixe donné. 

extends = /model/jxg/point.pl

before ==
sol = randint(-4, 4, [0]), randint(-4, 4, [0])
z = sol[0] + sol[1]*I
==

question ==
Placer le point $! M !$ d'affixe $! {{ z|latex }} !$ dans le plan ci-dessous.
==

attributes = {"showNavigation": False, "boundingbox":[-6, 6, 6, -6]}

tol = 0.2

pointname = "M"

jxgscript == #|js|
board.create('grid', [], {gridX: 1, gridY: 1});
board.create('axis', [[0, 0], [1, 0]], {name: 'Re', withLabel: true, label: {position:'urt', offset: [-5, 10]}, ticks:{visible: false}});
board.create('axis', [[0, 0], [0, 1]], {name: 'Im', withLabel: true, label: {position: 'urt', offset: [10, 0]}, ticks:{visible: false}});
var pt = board.create('point', [0, 0], {size: 2, name: 'M', color: 'blue'});
==


