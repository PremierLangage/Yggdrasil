extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg, fig2svg
from sympy.plotting import plot
import matplotlib.ticker as ticker
var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b

fig = plot(sol, (x,-5,5))._backend.fig
ax = fig.gca()
ax.grid(True)
ax.set_xlim(*xlim)
ax.set_ylim(*ylim)
ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
#ax.xaxis.set_major_locator(ticker.MaxNLocator(integer=True))
#ax.yaxis.set_major_locator(ticker.MaxNLocator(integer=True))
ax.set_xlabel('')
ax.set_ylabel('')
image = fig2svg(fig)
#image = plotsvg(sol)
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