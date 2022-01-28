extends = /model/math/checkbox.pl

before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt
from math import floor, ceil
from sympy.polys.polyfuncs import interpolate
import numpy as np

var('x')

# lst_pts = []
# while len(lst_pts) < 10:
#    x0, x1, x2, x3 = randint(-5, -4), randint(-2,-1), randint(1,2), randint(4,5)
#    y0, y1, y2, y3 = randint(-4, 4), randint(-4, 4), randint(-4, 4), randint(-4, 4)
#    f = interpolate([(x0, y0), (x1, y1), (x2, y2), (x3, y3)], x)
#    minf = minimum(f, x, Interval(-5,5)).evalf()
#    maxf = maximum(f, x, Interval(-5,5)).evalf()
#    if minf > -5 and maxf < 5:
#        lst_pts.append([(x0, y0), (x1, y1), (x2, y2), (x3, y3)])

pts = choice([[(-4, 0), (-2, -3), (1, -1), (4, 2)], [(-5, 4), (-1, -1), (2, 0), (4, 1)], [(-5, 1), (-2, 2), (2, 2), (5, -1)], [(-5, -4), (-1, -3), (2, -1), (5, 0)], [(-5, -1), (-1, 1), (1, 2), (4, 4)], [(-4, -4), (-1, -1), (1, 3), (5, -4)], [(-5, -2), (-2, 0), (2, 0), (4, 2)], [(-5, 3), (-1, -2), (2, 1), (5, 0)], [(-4, -2), (-2, -1), (2, 0), (5, 0)], [(-4, 3), (-2, 0), (2, -4), (5, 2)]])
f = interpolate(pts, x)

def minmax(f, a, b):
    lst = [f.evalf(subs={x: xi}) for xi in np.arange(a, b, 0.05)]
    return 0,4

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


sol = 0
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
for q in [0, 1]:
    valprop = choice([True, False])
    if q == 0:
        if valprop:
            c1 = randint(ceil(min1+0.1), floor(max1-0.1))
        else:
            c1 = choice(list(range(-5, ceil(min1-0.1))) + list(range(floor(max1+0.1)+1, 6))) 
        items.append(rf"$! \exists x \in \[{a1}, {b1}\],\ f(x) = {c1} !$")
    elif q == 1:
        if valprop:
            c2 = randint(-5, floor(max1))
        else:
            c2 = randint(floor(max1)+1, 5) 
        items.append(rf"$! \exists x \in \[{a2}, {b2}\],\ f(x) \ge {c2} !$")
    elif q == 2:
        items.append(r"$! \forall x \in A,\ x \textrm{ est pair} !$")
        valprop = all([x%2 == 0 for x in A])
    elif q == 3:
        items.append(r"$! \forall x \in A,\ x \textrm{ est impair} !$")
        valprop = all([x%2 != 0 for x in A])
    elif q == 4:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(rf"$! \exists x \in A,\ x \ge {d} !$")
        valprop = any([x >= d for x in A])
    elif q == 5:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(rf"$! \exists x \in A,\ x \le {d} !$")
        valprop = any([x <= d for x in A])
    elif q == 6:
        d = choice([randint(1, minA), randint(minA, maxA)])
        items.append(rf"$! \forall x \in A,\ x \ge {d} !$")
        valprop = all([x >= d for x in A])
    elif q == 7:
        d = choice([randint(minA, maxA), randint(maxA, n)])
        items.append(rf"$! \forall x \in A,\ x \le {d} !$")
        valprop = all([x <= d for x in A])
    if valprop:
        indsol.append(k)
    k += 1
==

question ==
{{a1}} {{b1}} {{min1}} {{max1}}
{{a2}} {{b2}} {{min2}} {{max2}}
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==
