extends = /model/math/expr.pl

before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt

var('x')
from sympy.polys.polyfuncs import interpolate
from sympy.calculus.util import minimum, maximum

f = interpolate([(-5, 2), (-2, 4), (2, -1), (5, 4)], x)
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
