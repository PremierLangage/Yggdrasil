extends = /model/math/expr.pl

title = Déterminer l'équation d'une droite


before ==
from plmpl import fig2svg, easyplot
import matplotlib.pyplot as plt

var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b

n = 5
plt.clf()
plt.xlim(-n, n)
plt.ylim(-n, n)
plt.grid(True)
plt.xticks(range(-n, n+1))
plt.yticks(range(-n, n+1))
easyplot(plt.gcf(), sol, -n, n)
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