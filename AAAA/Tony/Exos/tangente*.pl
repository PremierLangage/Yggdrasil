
extends = /model/math/expr.pl

title = Déterminer l'équation de la tangente à une fonction

before ==
from sympy import diff
var('x')
a = randint(1,5)
f = choice([sin(k*x),cos(k*x),x**k, exp(k*x),ln(k*x)])
g = diff(g)
sol = g(a)*x + f(a)-g(a)*a
image = plotsvg(sol)
==

text ==
Déterminer l'équation de la tangente à {{f|latex}} au point {{a|latex}} (en notant $! x !$ la variable d'abscisse et $! y !$ la variable d'ordonnée).

==

input_prefix = $! y = !$

solution ==
L'équation de la droite est :
$$ y = {{ sol|latex }}. $$
==

