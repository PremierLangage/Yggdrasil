extends = /model/math/expr.pl

before ==
from mplsympy import fig2svg, plot2svg, plot2, easyplot
import matplotlib.pyplot as plt

var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b
from matplotlib.figure import Figure
fig = Figure()
plt.figure(randint(1, 80))
n = 5
plt.xlim(-n, n)
plt.ylim(-n, n)
plt.grid(True)
plt.xticks(range(-n, n+1))
plt.yticks(range(-n, n+1))
easyplot(plt.gcf(), sol, -n, n)
image = fig2svg(plt.gcf())
#plt.close()
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