extends = /model/math/poly.pl

before ==
var('a')
sol = a**2 - 2
==

text ==
Développer l'expression suivante :

$$ {{ sol|latex }}. $$
==

poly_form = factorized
