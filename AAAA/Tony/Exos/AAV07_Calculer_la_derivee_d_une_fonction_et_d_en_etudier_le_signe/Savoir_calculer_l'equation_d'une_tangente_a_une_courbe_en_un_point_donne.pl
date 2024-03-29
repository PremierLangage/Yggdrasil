
extends = /model/math/expr.pl

title = Savoir calculer l'équation d'une tangente à une courbe en un point donné

before ==
from sympy import diff
from plrandom import randint
var('x')
a = randint(1,5)
k = randint(-5,5,[0])
f = choice([sin(k*x),cos(k*x),x**k, exp(k*x),ln(k*x)])
g = diff(f)
sol = g.subs(x,a)*x + f.subs(x,a)-g.subs(x,a)*a
==

text ==
Déterminer l'équation de la tangente à $!{{f|latex}}!$ au point $!{{a|latex}}!$ (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).

==

prefix = $! y = !$

solution ==
L'équation de la droite est :
$$ y = {{ sol|latex }}. $$
==

