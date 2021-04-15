
extends = /model/math/expr.pl

title = Déterminer l'équation d'une courbe

before ==
from mplsympy import plotsvg
from sympy import expand
var('x')


xA = randint(-4,-1)
yA = randint(-4,4)
xB=xA+randint(1,2)
yB=randint(-4,4)
xC=xB+randint(1,2)
yC=randint(-4,4)

sol = expand(yA*(x-xB)*(x-xC)/((xA-xB)*(xA-xC))+yB*(x-xA)*(x-xC)/((xB-xA)*(xB-xC))+ yC*(x-xB)*(x-xA)/((xC-xB)*(xC-xA)))
image = plotsvg(sol)
==

text ==
Déterminer l'équation de la courbe du polynome  de degré deux passant par les points de coordonnées:
$! ( {{ xA }}, {{ yA }} )!$, $! ( {{ xB }}, {{ yB }} )!$ et $! ( {{ xC }}, {{ yC }} )!$
 
 (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).

<div class="img-container">
{{ image }}
</div>
==

input_prefix = $! y = !$

solution ==
L'équation de la courbe est :
$$ y = {{ sol|latex }}. $$
==
