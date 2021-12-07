extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg, fig2svg, plot2svg, plot2, easyplot
from sympy.plotting import plot
import matplotlib.ticker as ticker

var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b

import matplotlib.pyplot as plt
import numpy as np

plt.xlim(-5, 5)
plt.ylim(-5, 5)
plt.grid(True)
plt.xticks(list(range(-5,6)))
plt.yticks(list(range(-5,6)))
#plt.axes().yaxis.set_major_locator(ticker.MultipleLocator(1))
easyplot(plt.gca(), sol, -1, 1)

image = fig2svg(plt.gcf())
==

question ==
{{t}} {{s}}
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==