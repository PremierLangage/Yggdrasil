# D. Doyen
# derivative, tangent
# Construire la tangente en un point à une courbe représentative connaissant le nombre dérivé.
# 1/6/2022

extends = /model/jxg/line.pl

title = Tracer une tangente

jxgscript == #|js|
var f = board.jc.snippet('{{ expr }}', true, 'x', true);
var c = board.create('functiongraph', [f, -5, 5]);

var pt1 = board.create('point', [-2, -2], {color:'black', name: 'A', size: 0.8, withLabel: false});
var pt2 = board.create('point', [2, 2], {color:'black', name: 'B', size: 0.8, withLabel: false});
var line = board.create('line', [pt1, pt2], {color:'black'});
==

before ==
from sympy.polys.polyfuncs import interpolate
from sympy import diff
var('x')

pts = choice([[(-5, 2), (-1, 3), (1, 0), (4, -3)], [(-5, -1), (-1, -2), (2, 3), (5, -2)], [(-5, -2), (-1, 2), (1, -2), (5, 1)], [(-5, 4), (-2, -4), (2, 1), (5, 1)], [(-4, -4), (-1, -2), (2, 1), (4, 3)], [(-4, -1), (-1, 2), (2, 1), (5, 4)], [(-4, 3), (-2, 2), (1, -3), (5, 2)], [(-5, -4), (-1, 3), (1, 3), (5, -2)], [(-4, -4), (-1, -3), (2, 0), (5, 4)], [(-4, 1), (-1, 3), (2, -2), (5, 1)]])
f = interpolate(pts, x)
expr = str(f).replace("**", "^")
while True:
    a = randint(-3, 3)
    slope = diff(f, x).evalf(subs={x:a})
    if abs(slope) > 0.3:
        break

approx_dfxa = slope.round(1)
sol = [[a, f.evalf(subs={x:a})], [a+1, f.evalf(subs={x:a}) + slope]]
==

attributes = {"showNavigation": True, "boundingbox":[-5, 5, 5, -5]}

tol = 0.15

question ==
On considère la fonction $! f !$ dont la courbe représentative est tracée ci-desssous (en bleu). Tracer la tangente à cette courbe au point d'abscisse $!{{a}} !$ sachant que $! f'( {{a}} ) \approx {{approx_dfxa}} !$. Pour tracer la tangente, on déplacera la droite noire à l'aide des deux points de contrôle.
==