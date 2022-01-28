extends = /model/math/expr.pl

before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt
from sympy.polys.polyfuncs import interpolate
from sympy.calculus.util import minimum, maximum

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
f = interpolate([(-4, 0), (-2, -3), (1, -1), (4, 2)], x)

len1 = randint(2, 6)
a1 = randint(-5, 5-len1)
b1 = a1 + len1
min1 = 0 #minimum(f, x, Interval(a1, b1)).evalf()
max1 = 0 #maximum(f, x, Interval(a1, b1)).evalf()

len2 = randint(2, 6)
a2 = randint(-5, 5-len2)
b2 = a2 + len2
min2 = 0 #minimum(f, x, Interval(a2, b2)).evalf()
max2 = 0 #maximum(f, x, Interval(a2, b2)).evalf()

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
