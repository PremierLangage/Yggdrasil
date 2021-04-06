extends = /model/math/expr.pl


title = Graphique

before ==
from plmpl import plotsvg
x = symbols('x')
a = Rational(randint(-4, 4, [0]),2)
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