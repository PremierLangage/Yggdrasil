extends = /model/jxg/line.pl


jxgscript == #|js|
var f = board.jc.snippet('{{ expr }}', true, 'x', true);
var pt1 = board.create('point', [-2, -2], {color:'blue', name: 'A', size: 0.5, withLabel: false, snapToGrid: true});
var pt2 = board.create('point', [2, 2], {color:'blue', name: 'B', size: 0.5, withLabel: false, snapToGrid: true});
var line = board.create('line', [pt1, pt2], {color:'blue'});
==

before ==
from sympy.polys.polyfuncs import interpolate
from sympy import diff
var('x')

pts = choice([[(-5, 2), (-1, 3), (1, 0), (4, -3)], [(-5, -1), (-1, -2), (2, 3), (5, -2)], [(-5, -2), (-1, 2), (1, -2), (5, 1)], [(-5, 4), (-2, -4), (2, 1), (5, 1)], [(-4, -4), (-1, -2), (2, 1), (4, 3)], [(-4, -1), (-1, 2), (2, 1), (5, 4)], [(-4, 3), (-2, 2), (1, -3), (5, 2)], [(-5, -4), (-1, 3), (1, 3), (5, -2)], [(-4, -4), (-1, -3), (2, 0), (5, 4)], [(-4, 1), (-1, 3), (2, -2), (5, 1)]])
f = interpolate(pts, x)
expr = str(f).replace("**", "^")
while True:
    a = randint(-4, 4)
    slope = diff(f, x).evalf(subs={x:a})
    if abs(slope) > 0.3:
        break

sol = [[a, f.evalf(subs={x:a})], [a+1, f.evalf(subs={x:a}) + slope]]
==

attributes = {"showNavigation": True, "boundingbox":[-5, 5, 5, -5]}

tol = 0.1S

question ==
On considère la fonction $! f !$ dont le graphe est tracé ci-desssous. En utilisant l'outil graphique qui affiche la tangente à la courbe, déterminer une valeur approchée de $! f( {{a}} ) !$ (à 15% près).
{{ slope }}
==