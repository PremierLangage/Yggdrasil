
extends = dr_expr.pl

title = Calculer la distance entre deux points du plan

before ==
import sys
text= sys.version

xA = randint(-5, 5)
yA = randint(-5, 5)
xB = randint(-5, 5)
yB = randint(-5, 5)
sol = sqrt((xA-xB)**2 + (yA-yB)**2)
==

text ==
Dans le plan muni d'un repère orthonormé on considère les points de coordonnées 
$! ( {{ xA }}, {{ yA }} ) !$ et $! ( {{ xB }}, {{ yB }} ) !$.

Calculer et donner la distance enclidienne entre ces deux points ?
==