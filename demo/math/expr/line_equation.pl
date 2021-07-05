extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg
var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b
image = plotsvg(sol)
==

question ==
Déterminer l'équation de la droite tracée ci-dessous (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).
<div class="img img-60">
{{ image }}
</div>
==

prefix ==
$! y = !$
==