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

plt.clf()
easyplot(plt.gca(), sol, -1, 1)
plt.grid(True)

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