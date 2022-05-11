extends = /model/math/numeric.pl

script ==
var f = board.jc.snippet('{{ expr }}', true, 'x', true);
var c = board.create('functiongraph', [f, -5, 5]);
var g = board.create('glider', [0, 0, c], {name:'',style:8, color:'black'});
var t = board.create('tangent', [g], {dash:2,strokeColor:'black'});
==

before ==
from jxginput import JXGViewer
from math import floor, ceil
from sympy.polys.polyfuncs import interpolate
import numpy as np

var('x')

# lst = []
# for i in range(200):
#     x0, x1, x2, x3 = randint(-5, -4), randint(-2,-1), randint(1,2), randint(4,5)
#     y0, y1, y2, y3 = randint(-4, 4), randint(-4, 4), randint(-4, 4), randint(-4, 4)
#     f = interpolate([(x0, y0), (x1, y1), (x2, y2), (x3, y3)], x)
#     minf, maxf = minmax(f, -5, 5)
#     if minf > -4.5 and maxf < 4.5 and maxf-minf > 7:
#         lst.append([(x0, y0), (x1, y1), (x2, y2), (x3, y3)])
#     if len(lst)==10:
#         break

pts = choice([[(-5, 2), (-1, 3), (1, 0), (4, -3)], [(-5, -1), (-1, -2), (2, 3), (5, -2)], [(-5, -2), (-1, 2), (1, -2), (5, 1)], [(-5, 4), (-2, -4), (2, 1), (5, 1)], [(-4, -4), (-1, -2), (2, 1), (4, 3)], [(-4, -1), (-1, 2), (2, 1), (5, 4)], [(-4, 3), (-2, 2), (1, -3), (5, 2)], [(-5, -4), (-1, 3), (1, 3), (5, -2)], [(-4, -4), (-1, -3), (2, 0), (5, 4)], [(-4, 1), (-1, 3), (2, -2), (5, 1)]])
f = interpolate(pts, x)
expr = str(f).replace("**", "^")
while True
    a  randint(-4, 4)
    sol = diff(f, x).evalf(subs={x:1.})
    if abs(sol) > 0.3:
        break

jxg = JXGViewer()
jxg.set_attributes(attributes)
jxg.set_script(script, globals())
==

attributes = {"showNavigation": True, "boundingbox":[-5, 5, 5, -5]}


question ==
En utilisant l'outil graphique qui affiche la tangente à la courbe, déterminer une valeur approchée de $! f( {{a}} ) !$.
{{ jxg|html }}
==

style.jxgcss ==
<style>
.jsxgraph-component {
    width: 400px;
    height: 400px;
    margin: 0 auto;
    border: 1px solid;
}
</style>
==

prefix ==
$! f( {{a}} ) \approx !$
==
