extends = /model/math/expr.pl


title = Graphique

before ==
from mplsympy import plotsvg
x = symbols('x')
a = choice([-1, 1]) * (randint(0,1)+ choice([0, Rational(1, 2), Rational(1, 4), Rational(1, 3), Rational(2, 3), Rational(3, 4)]))
b = randint(-2, 2)
sol = a*x+b
image = plotsvg(sol)
==

text ==
Déterminer l'équation de la droite tracée ci-dessous.

<div class="img-container">
{{ image }}
</div>
==

input_prefix = $! y = !$