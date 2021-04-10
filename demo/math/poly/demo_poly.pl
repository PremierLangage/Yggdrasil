extends = /model/math/poly.pl

before ==
from sympy import poly
var('a')
sol = a**2 + 2
p = poly(sol)
d = p.degree()
==

text ==
{{d}}
Développer l'expression suivante :

$$ {{ sol|latex }}. $$
==

poly_form = factorized
