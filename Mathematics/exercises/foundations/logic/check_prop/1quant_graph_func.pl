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
x0, x1, x2, x3 = randint(-5, -4), randint(-2,-1), randint(1,2), randint(4,5)
y0, y1, y2, y3 = randint(-4, 4), randint(-4, 4), randint(-4, 4), randint(-4, 4)
f = interpolate([(x0, y0), (x1, y1), (x2, y2), (x3, y3)], x)
minf = minimum(f, x, Interval(-5,5)).evalf()
maxf = maximum(f, x, Interval(-5,5)).evalf()

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
{{minf}} {{maxf}}
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==
