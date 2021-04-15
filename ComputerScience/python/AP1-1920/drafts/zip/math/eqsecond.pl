
extends = /model/math/expr.pl

title = Déterminer l'équation d'une courbe

before ==
from mplsympy import plotsvg
var('x')

#xA = choice([-1, 1]) * sympify(choice(['1/2', 1, '3/2', 2]))
#yA = choice([-1, 1]) * sympify(choice(['1/2', 1, '3/2', 2]))
#xB=randint(-4,4)
#yB=randint(-4,4)
#xC=randint(-4,4)
#yC=randint(-4,4)


xA = randint(-4,-1)
yA = randini(-4,4)
xB=xA+randint(1,2)
yB=randint(-4,4)
xC=xB+randint(1,2)
yC=randint(-4,4)

sol = yA*(x-xB)*(x-xC)/((xA-xB)*(xA-xC))+yB*(x-xA)*(x-xC)/((xB-xA)*(xB-xC))+ yC*(x-xB)*(x-xA)/((xC-xB)*(xC-xA))
image = plotsvg(sol)
==

text ==
Déterminer l'équation de la courbe du polynome  de degré deux passant par les points de coordonnées:
$! ( {{ xA }}, {{ yA }} )!$$! ( {{ xB }}, {{ yB }} )!$ et $! ( {{ xC }}, {{ yC }} )!$
 
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
