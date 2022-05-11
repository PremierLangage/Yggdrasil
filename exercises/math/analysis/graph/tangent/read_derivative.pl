extends = /model/math/expr.pl

script ==
var f = board.create('functiongraph', [function(x){return {{ f }};}, -5, 5]);
var t = board.create('tangent', [f], {dash:2, strokeColor:'#aa0000'});
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


jxg = JXGViewer()
xA, yA = randint(-5, 5), randint(-5, 5)
xB, yB = randint(-5, 5), randint(-5, 5)
sol = (xB-xA, yB-yA)
jxg.set_attributes(attributes)
jxg.set_script(script, globals())
==

attributes = {"showNavigation": False, "boundingbox":[-5, 5, 5, -5]}


before2 ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt
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

def minmax(f, a, b):
    lst = [f.evalf(subs={x: xi}) for xi in np.arange(a, b, 0.02)]
    return min(lst), max(lst)

max1, min1 = 0, 0
while max1-min1 < 2.3:
    len1 = randint(4, 6)
    a1 = randint(-5, 5-len1)
    b1 = a1 + len1
    min1, max1 = minmax(f, a1, b1)

max2, min2 = 0, 0
while max2-min2 < 2.3:
    len2 = randint(4, 6)
    a2 = randint(-5, 5-len2)
    b2 = a2 + len2
    min2, max2 = minmax(f, a2, b2)

n = 5
plt.clf()
plt.xlim(-n, n)
plt.ylim(-n, n)
plt.grid(True)
plt.xticks(range(-n, n+1))
plt.yticks(range(-n, n+1))
easyplot(plt.gcf(), f, -n, n)
image = fig2svg(plt.gcf())

items = []
indsol = []
k = 0
for q in [0, 1, 2, 3]:
    valprop = choice([True, False])
    if q == 0:
        if valprop:
            c = randint(ceil(min1+0.1), floor(max1-0.1))
        else:
            c = floor(min1-0.1)
        items.append(rf"$! \exists x \in \[{a1}, {b1}\],\ f(x) \le {c} !$")
    elif q == 1:
        if valprop:
            c = randint(ceil(min2+0.1), floor(max2-0.1))
        else:
            c = ceil(max2+0.1)
        items.append(rf"$! \exists x \in \[{a2}, {b2}\],\ f(x) \ge {c} !$")
    elif q == 2:
        if valprop:
            c = floor(min1-0.1)
        else:
            c = randint(ceil(min1+0.1), floor(max1-0.1))
        items.append(rf"$! \forall x \in \[{a1}, {b1}\],\ f(x) \ge {c} !$")
    elif q == 3:
        if valprop:
            c = ceil(max2+0.1)
        else:
            c = randint(ceil(min2+0.1), floor(max2-0.1))
        items.append(rf"$! \forall x \in \[{a2}, {b2}\],\ f(x) \le {c} !$")
    if valprop:
        indsol.append(k)
    k += 1
==

question ==
Déterminer les coordoonées du vecteur représenté ci-dessous.
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
$! y = !$
==
