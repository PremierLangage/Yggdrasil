extends = /model/math/expr.pl


title = Graphique

before ==
from mplsympy import plotsvg
x = symbols('x')
a = choice([-1, 1]) * (randint(0,1)+ Rational(randint(1, 12), randint(1, 4))
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