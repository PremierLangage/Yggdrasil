title = Calcul de dérivées
extends = /model/math/expr.pl
extends = /model/math/input0.pl

before ==
from sympy import series
var('x')
var('a')

n = randint(1, 10)
p = randint(1, 10)
m = randint(1, 10)

h1 = cos(p*(x**n))
h2 = m * x * exp(n*x)
h3 = m/(x**p)
h4 = sin(p*x)**m
h5 = sqrt(n*x + p)
h6 = ln(x**m + n*x)
h7 = tan(p*x)

h = choice([h1, h2, h3, h4, h5, h6, h7])

sol = diff(h, x).doit()
==

question ==
Dériver la fonction $! h(x) = {{ h|latex }} !$, en développant le plus possible.
==

embed ==
==

prefix ==
==

latexsettings.order = 'ilex'


