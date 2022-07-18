# D. Doyen
# derivative, tangent
# Déterminer graphiquement un nombre dérivé par la pente de la tangente. 
# 1/6/2022

extends = /model/math/numeric.pl

title = Déterminer graphiquement un nombre dérivé

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

pts = choice([[(-5, 2), (-1, 3), (1, 0), (4, -3)], [(-5, -1), (-1, -2), (2, 3), (5, -2)], [(-5, -2), (-1, 2), (1, -2), (5, 1)], [(-5, 4), (-2, -4), (2, 1), (5, 1)], [(-4, -4), (-1, -2), (2, 1), (4, 3)], [(-4, -1), (-1, 2), (2, 1), (5, 4)], [(-4, 3), (-2, 2), (1, -3), (5, 2)], [(-5, -4), (-1, 3), (1, 3), (5, -2)], [(-4, -4), (-1, -3), (2, 0), (5, 4)], [(-4, 1), (-1, 3), (2, -2), (5, 1)]])
f = interpolate(pts, x)
expr = str(f).replace("**", "^")
while True:
    a = randint(-4, 4)
    sol = diff(f, x).evalf(subs={x:a})
    if abs(sol) > 0.3:
        break

jxg = JXGViewer()
jxg.set_attributes(attributes)
jxg.set_script(script, globals())
==

attributes = {"showNavigation": True, "boundingbox":[-5, 5, 5, -5]}

tol = 0.15

question ==
On considère la fonction $! f !$ dont la courbe représentative est tracée ci-desssous. En utilisant l'outil graphique qui affiche la tangente à la courbe, déterminer une valeur approchée de $! f'( {{a}} ) !$ (à 15% près).
<br><br>
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
$! f'( {{a}} ) \approx !$
==
