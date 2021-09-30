
#Auteur  = inconnu, récupéré de la base commune, repris par Tony Février et Jeanne Parmentier
#Date = 22/07/2021
#Etat = marche

extends = /model/math/expr.pl

before ==
from mplsympy import plotsvg
var('x')
a = choice([-1, 1]) * choice([Rational(1, 2), 1, Rational(3, 2), 2])
b = randint(-3, 3)
sol = a*x + b
xA = randint(-2, 2)
xB = randint(-2, 2,[xA])
yA = a*xA + b
yB = a*xB + b
==

question ==
Déterminer l'équation de la droite passant par les points $! ( {{ xA }}, {{ yA }} ) !$ et $! ( {{ xB }}, {{ yB }} ) !$.
On note $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée. On attend une réponse de la forme $! y = ax+b !$.

==

prefix ==
$! y = !$
==