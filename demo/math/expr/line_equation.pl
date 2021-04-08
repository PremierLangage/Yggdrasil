extends = /model/math/expr.pl

title = Déterminer l'équation d'une droite

before ==
from mplsympy import plotsvg
x = symbols('x')
a = choice([-1, 1]) * sympify(choice(['1/2',1,'3/2',2]))
b = randint(-3, 3)
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