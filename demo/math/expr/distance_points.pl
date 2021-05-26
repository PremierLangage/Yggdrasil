extends = /model/math/expr.pl

title = Calculer la distance entre deux points du plan

before ==
xA = randint(-5, 5)
yA = randint(-5, 5)
xB = randint(-5, 5)
yB = randint(-5, 5)
sol = sqrt((xA-xB)**2 + (yA-yB)**2)
==

question ==
Dans le plan muni d'un repère orthonormé on considère les points de coordonnées 
$! {{ (xA, yA) }} !$ et $! {{ (xB, yB) }} !$.

Quelle est la distance entre ces deux points ?
==