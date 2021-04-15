
extends = /model/math/expr.pl

title = Déterminer l'équation d'une courbe

before ==
from mplsympy import plotsvg
var('x')
xA = choice([-1, 1]) * sympify(choice(['1/2', 1, '3/2', 2]))
b = randint(-3, 3)
yA = choice([-1, 1]) * sympify(choice(['1/2', 1, '3/2', 2]))
sol = a*x + b
image = plotsvg(sol)
==

text ==
Déterminer l'équation de la courbe du polynome  de degré deux passant par les points de coordonnées:
 {{(xA,yA)}}
 
 (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).

<div class="img-container">
{{ image }}
</div>
==

input_prefix = $! y = !$

solution ==
L'équation de la droite est :
$$ y = {{ sol|latex }}. $$
==
