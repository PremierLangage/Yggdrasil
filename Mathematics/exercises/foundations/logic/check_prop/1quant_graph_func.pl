extends = /model/math/expr.pl

before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt

var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b

from sympy.polys.polyfuncs import interpolate
from sympy.calculus.util import minimum, maximum
t = 0

while True:
    t +=1
    x0, x1, x2, x3 = randint(-5, -4), randint(-2,-1), randint(1,2), randint(4,5)
    y0, y1, y2, y3 = randint(-4, 4), randint(-4, 4), randint(-4, 4), randint(-4, 4)
    f = interpolate([(x0, y0), (x1, y1), (x2, y2), (x3, y3)], x)
    minf = minimum(f, x, Interval(-5,5)).evalf()
    maxf = maximum(f, x, Interval(-5,5)).evalf()
    if minf > -5 and maxf < 5 and maxf-minf > 4:
        break

while True:
    len1 = randint(2, 6)
    a1 = randint(-5, 5-len1)
    b1 = a1 + len1
    min1 = minimum(f, x, Interval(a1, b1)).evalf()
    max1 = maximum(f, x, Interval(a1, b1)).evalf()
    if max1-min1 > 1:
        break

while True:
    len2 = randint(2, 6)
    a2 = randint(-5, 5-len2)
    b2 = a2 + len2
    min2 = minimum(f, x, Interval(a2, b2)).evalf()
    max2 = maximum(f, x, Interval(a2, b2)).evalf()
    if max2-min2 > 1 and (a2, b2) != (a1, b1):
        break

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
{{minf}} {{maxf}} {{t}}
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==
