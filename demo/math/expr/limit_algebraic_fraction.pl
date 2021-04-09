extends = /model/math/expr.pl

title = Limite d'une fraction rationnelle

before ==
from randsympy import randint_poly
from sympy import Limit

var('x')

deg = randint(1, 3)
f = randint_poly(deg, randint(2, deg + 1), 5, "x")
deg = randint(1, 3)
g = randint_poly(deg, randint(2, deg + 1), 5, "x")

lim = Limit(f/g, x, oo)
sol = lim.doit()
==

text ==
Déterminer $$ {{ lim|latex }}. $$
==
