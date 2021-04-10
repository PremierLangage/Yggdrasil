extends = /model/math/poly.pl

before ==
var('x')
sol = x**2 - 1
==

text ==
Développer l'expression suivante :

$$ {{ sol|latex }}. $$
==

poly_form = factorized
