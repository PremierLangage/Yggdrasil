extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg, fig2svg, plot2svg, plot2
from sympy.plotting import plot
import matplotlib.ticker as ticker
var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b

import matplotlib.pyplot as plt
import numpy as np

def easyplot(ax, expr, xmin, xmax):
    sb = list(expr.free_symbols)
    t = np.arange(0.0, 2.0, 0.01)
    s =[]
    for t0 in t:
        s.append(expr.subs({sb[0]:t0}))
    #s = 1 + np.sin(2*np.pi*t)
    ax.plot(t, s)

easyplot(plt.gca(), sol, -1, 1)
plt.grid(True)

image = fig2svg(plt.gcf())
==

question ==
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img w60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==