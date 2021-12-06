extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg, fig2svg, plot2svg, plot2
from sympy.plotting import plot
import matplotlib.ticker as ticker
var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b
#p = plot2(sol, (x,-5,5))
#p.append(plot(x,x,-3,1)[0])
#image = plot2svg(0)
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